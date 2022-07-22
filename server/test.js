describe("Server' initialisation", () => {
    describe("Layers' creation", () => {
        require('./admin/create-layers');
    });
    describe("Layers' update", () => {
        require('./admin/update-layers');
    });
});

describe("WMS", () => {
    describe("GetCapabilities", () => {
        require('./wms/getcapabilities');
    });
    describe("GetMap", () => {
        require('./wms/getmap');
    });
    describe("GetFeatureInfo", () => {
        require('./wms/getfeatureinfo');
    });
});

describe("WMTS", () => {
    describe("GetCapabilities", () => {
        require('./wmts/getcapabilities');
    });
    describe("GetTile", () => {
        require('./wmts/gettile');
    });
    describe("GetFeatureInfo", () => {
        require('./wmts/getfeatureinfo');
    });
});

describe("OGCAPI-Tiles", () => {
    describe("GetCapabilities", () => {
        require('./ogcapitiles/getcapabilities');
    });
    describe("GetTile", () => {
        require('./ogcapitiles/gettile');
    });
    describe("GetFeatureInfo", () => {
        require('./ogcapitiles/getfeatureinfo');
    });
});

describe("TMS", () => {
    describe("GetCapabilities", () => {
        require('./tms/getcapabilities');
    });
    describe("GetLayer", () => {
        require('./tms/getlayer');
    });
    describe("GetMetadataJson", () => {
        require('./tms/getmetadatajson');
    });
    describe("GetGdalXml", () => {
        require('./tms/getgdalxml');
    });
    describe("GetTile", () => {
        require('./tms/gettile');
    });
});

describe("Server' health check", () => {
    describe("Get health routes", () => {
        require('./healthcheck/gets');
    });
});

describe("Server' cleaning", () => {
    describe("Layers' deletion", () => {
        require('./admin/delete-layers');
    });
});