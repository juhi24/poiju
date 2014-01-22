import QtQuick 2.0
import QtQuick.XmlListModel 2.0

XmlListModel {
    property string city: "kumpula"
    source: "http://data.fmi.fi/fmi-apikey/" + constant.fmiAPIkey + "/wfs?" +
            "request=getFeature&" +
            "storedquery_id=fmi::observations::weather::timevaluepair&" +
            "place=" + city + "&" +
            //"parameters=pressure,temperature" +
            ""
    namespaceDeclarations: "declare namespace wfs='http://www.opengis.net/wfs/2.0';" +
                           "declare namespace xsi='http://www.w3.org/2001/XMLSchema-instance';" +
                           "declare namespace xlink='http://www.w3.org/1999/xlink';" +
                           "declare namespace om='http://www.opengis.net/om/2.0';" +
                           "declare namespace ompr='http://inspire.ec.europa.eu/schemas/ompr/2.0rc3';" +
                           "declare namespace omso='http://inspire.ec.europa.eu/schemas/omso/2.0rc3';" +
                           "declare namespace gml='http://www.opengis.net/gml/3.2';" +
                           "declare namespace gmd='http://www.isotc211.org/2005/gmd';" +
                           "declare namespace gco='http://www.isotc211.org/2005/gco';" +
                           "declare namespace swe='http://www.opengis.net/swe/2.0';" +
                           "declare namespace gmlcov='http://www.opengis.net/gmlcov/1.0';" +
                           "declare namespace sam='http://www.opengis.net/sampling/2.0';" +
                           "declare namespace sams='http://www.opengis.net/samplingSpatial/2.0';" +
                           "declare namespace wml2='http://www.opengis.net/waterml/2.0';" +
                           "declare namespace target='http://xml.fmi.fi/namespace/om/atmosphericfeatures/0.95';"
    query: "/wfs:FeatureCollection/wfs:member"

    XmlRole {
        name: "timestamp"
        query: "omso:PointTimeSeriesObservation/om:result/wml2:MeasurementTimeseries/wml2:point[last()]/wml2:MeasurementTVP/wml2:time/string()"
    }
    XmlRole {
        name: "obsval"
        query: "omso:PointTimeSeriesObservation/om:result/wml2:MeasurementTimeseries/wml2:point[last()]/wml2:MeasurementTVP/wml2:value/string()"
    }
}
