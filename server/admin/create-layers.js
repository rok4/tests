var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("Create TEST_ALTI layer", done => {
    chai
        .request(common.SERVER_URL)
        .post("/admin/layers/TEST_ALTI")
        .send({
            "wms": {
                "authorized": true,
                "crs": ["IGNF:LAMB93", "CRS:84", "IGNF:WGS84G", "EPSG:3857", "EPSG:4326"]
            },
            "tms": {
                "authorized": true
            },
            "keywords": ["UTM20W84MART_1M_MNT", "RASTER", "MNT"],
            "wmts": {
                "authorized": true
            },
            "pyramids": [
                {
                    "top_level": "0",
                    "path": "s3://pyramids/ALTI.json",
                    "bottom_level": "6"
                }
            ],
            "title": "TEST_ALTI",
            "resampling": "nn",
            "abstract": "Diffusion de la donnée brute ALTI",
            "styles": ["normal", "hypso"],
            "get_feature_info": {
                "type": "PYRAMID"
            }
        })
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});

it("Create TEST_PENTE layer", done => {
    chai
        .request(common.SERVER_URL)
        .post("/admin/layers/TEST_PENTE")
        .send({
            "title": "TEST_PENTE",
            "abstract": "Diffusion de la donnée brute PENTE",
            "wmts": {
                "authorized": true
            },
            "keywords": ["PM", "RASTER", "MNT"],
            "tms": {
                "authorized": true
            },
            "styles": [
                "normal"
            ],
            "pyramids": [
                {
                    "path": "s3://pyramids/PENTE.json",
                    "top_level": "0",
                    "bottom_level": "13"
                }
            ],
            "wms": {
                "crs": ["EPSG:3857", "CRS:84", "IGNF:WGS84G", "EPSG:4326"],
                "authorized": true
            },
            "get_feature_info": {
                "type": "EXTERNALWMS",
                "url": `${common.SERVER_URL}/wms`,
                "layers": "TEST_ALTI",
                "query_layers": "TEST_ALTI",
                "version": "1.3.0",
                "service": "WMS"
            }
        })
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});

it("Create TEST_BDORTHO layer", done => {
    chai
        .request(common.SERVER_URL)
        .post("/admin/layers/TEST_BDORTHO")
        .send({
            "wms" : {
               "authorized" : true,
               "crs" : ["EPSG:3857","CRS:84","IGNF:WGS84G","EPSG:4326"]
            },
            "abstract" : "Diffusion de la donnée BDORTHO",
            "title" : "TEST_BDORTHO",
            "pyramids" : [
               {
                  "bottom_level" : "15",
                  "path": "s3://pyramids/BDORTHO.json",
                  "top_level" : "0"
               }
            ],
            "styles" : ["normal"],
            "tms" : {
               "authorized" : true
            },
            "wmts" : {
               "authorized" : true
            },
            "keywords" : ["PM","RASTER"]
         })
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});