var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("Update RGEALTI layer", done => {
    chai
        .request(common.SERVER_URL)
        .put("/admin/layers/RGEALTI")
        .send({
            "wms": {
                "authorized": true,
                "crs": ["IGNF:LAMB93", "CRS:84", "IGNF:WGS84G", "EPSG:3857", "EPSG:4326"]
            },
            "tms": {
                "authorized": true
            },
            "keywords": ["LAMB93_1M_MNT", "RASTER"],
            "wmts": {
                "authorized": true
            },
            "pyramids": [
                {
                    "top_level": "0",
                    "path": "/pyramids/RGEALTI.json",
                    "bottom_level": "8"
                }
            ],
            "title": "RGEALTI modifié",
            "resampling": "nn",
            "abstract": "Diffusion de la donnée brute RGEALTI",
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

it("Update MONTAGNE layer", done => {
    chai
        .request(common.SERVER_URL)
        .put("/admin/layers/MONTAGNE")
        .send({
            "title": "MONTAGNE modifié",
            "abstract": "Diffusion de la donnée Pente depuis le RGEALTI",
            "wmts": {
                "authorized": true
            },
            "keywords": ["PM", "RASTER"],
            "tms": {
                "authorized": false
            },
            "styles": [
                "normal"
            ],
            "pyramids": [
                {
                    "path": "/pyramids/MONTAGNE.json",
                    "top_level": "0",
                    "bottom_level": "17"
                }
            ],
            "wms": {
                "crs": ["EPSG:3857", "CRS:84", "IGNF:WGS84G", "EPSG:4326"],
                "authorized": true
            },
            "get_feature_info": {
                "type": "EXTERNALWMS",
                "url": "http://front/wms",
                "layers": "RGEALTI",
                "query_layers": "RGEALTI",
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

it("Update SCAN1000 layer", done => {
    chai
        .request(common.SERVER_URL)
        .put("/admin/layers/SCAN1000")
        .send({
            "wms" : {
               "authorized" : true,
               "crs" : ["EPSG:3857","CRS:84","IGNF:WGS84G","EPSG:4326"]
            },
            "abstract" : "Diffusion de la donnée SCAN1000",
            "title" : "SCAN1000 modifié",
            "pyramids" : [
               {
                  "bottom_level" : "10",
                  "path" : "/pyramids/SCAN1000.json",
                  "top_level" : "0"
               }
            ],
            "attribution": {
                "title" : "Attribué aux tests",
                "url": "https://github.com/rok4"
            },
            "styles" : ["normal"],
            "tms" : {
               "authorized" : true
            },
            "bbox" : {
                "east": 1.9756,
                "west": 1.6989,
                "north": 46.3259,
                "south": 46.1275
            },
            "wmts" : {
               "authorized" : true,
               "tms": ["4326"]
            },
            "keywords" : ["PM","RASTER"],
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

it("Update BDPARCELLAIRE layer", done => {
    chai
        .request(common.SERVER_URL)
        .put("/admin/layers/BDPARCELLAIRE")
        .send({
            "wms" : {
               "authorized" : true,
               "crs" : ["EPSG:3857","CRS:84","IGNF:WGS84G","EPSG:4326"]
            },
            "abstract" : "Diffusion de la donnée BDPARCELLAIRE",
            "title" : "BDPARCELLAIRE modifié",
            "pyramids" : [
               {
                  "bottom_level" : "19",
                  "path" : "/pyramids/BDPARCELLAIRE.json",
                  "top_level" : "0"
               }
            ],
            "styles" : ["normal", "orange"],
            "tms" : {
               "authorized" : true
            },
            "wmts" : {
               "authorized" : true
            },
            "keywords" : ["4326","RASTER"],
            "get_feature_info": {
                "type": "EXTERNALWMS",
                "url": "http://fake/wms",
                "layers": "WRONG",
                "query_layers": "WRONG_AGAIN",
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