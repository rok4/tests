var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("TEST_BDORTHO : no data", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=TEST_BDORTHO&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=PM&TILEMATRIX=11&TILEROW=729&TILECOL=1038")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(404);
            done();
        });
});

it("TEST_BDORTHO : unknown TMS", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=TEST_BDORTHO&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=fake&TILEMATRIX=11&TILEROW=724&TILECOL=1037")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("TEST_BDORTHO : wrong TMS for this layer", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=TEST_BDORTHO&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=PM_5cm&TILEMATRIX=11&TILEROW=724&TILECOL=1037")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("TEST_BDORTHO : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=TEST_BDORTHO&STYLE=normal&FORMAT=image/jpeg&TILEMATRIXSET=PM&TILEMATRIX=12&TILEROW=1881&TILECOL=1354")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_BDORTHO : valid (additionnal TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=TEST_BDORTHO&STYLE=normal&FORMAT=image/jpeg&TILEMATRIXSET=4326&TILEMATRIX=7&TILEROW=53&TILECOL=84")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});
