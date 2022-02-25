var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("SCAN1000 : no data", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=SCAN1000&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=PM&TILEMATRIX=11&TILEROW=729&TILECOL=1038")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(404);
            done();
        });
});

it("SCAN1000 : unknown TMS", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=SCAN1000&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=fake&TILEMATRIX=11&TILEROW=724&TILECOL=1037")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("SCAN1000 : wrong TMS for this layer", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=SCAN1000&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=PM_5cm&TILEMATRIX=11&TILEROW=724&TILECOL=1037")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("SCAN1000 : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=SCAN1000&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=PM&TILEMATRIX=8&TILEROW=90&TILECOL=129")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("BDPARCELLAIRE : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=BDPARCELLAIRE&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=4326&TILEMATRIX=18&TILEROW=61673&TILECOL=272102")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("BDPARCELLAIRE : valid (native TMS + style)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=BDPARCELLAIRE&STYLE=orange&FORMAT=image/png&TILEMATRIXSET=4326&TILEMATRIX=18&TILEROW=61673&TILECOL=272102")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("BDPARCELLAIRE : unknown style", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=BDPARCELLAIRE&STYLE=fake&FORMAT=image/png&TILEMATRIXSET=4326&TILEMATRIX=18&TILEROW=61673&TILECOL=272102")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("BDPARCELLAIRE : wrong style", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=BDPARCELLAIRE&STYLE=estompage&FORMAT=image/png&TILEMATRIXSET=4326&TILEMATRIX=18&TILEROW=61673&TILECOL=272102")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("SCAN1000 : valid (additionnal TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=SCAN1000&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=4326&TILEMATRIX=10&TILEROW=248&TILECOL=1034")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("MONTAGNE : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=MONTAGNE&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=PM&TILEMATRIX=16&TILEROW=23940&TILECOL=33030")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});
