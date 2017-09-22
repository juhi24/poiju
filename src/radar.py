# coding: utf-8
from __future__ import absolute_import, division, print_function, unicode_literals
__metaclass__ = type

import matplotlib.pyplot as plt
import geopandas as gpd
import georasters as gr
import rasterio
from rasterio.plot import show

plt.close('all')

radurl = 'http://wms.fmi.fi/fmi-apikey/bc6e84a3-d0bb-4cfa-9e51-f6d0f390a429/geoserver/Radar/ows?service=WMS&request=GetMap&format=image/geotiff&bbox=-118331.366,6335621.167,875567.732,7907751.537&width=1700&height=2500&srs=EPSG:3067&layers=Radar:suomi_dbz_eureffin'
rad = 'Radar-suomi_dbz_eureffin.tif'
world = gpd.read_file('ne_10m_admin_0_countries.shp')
finland = world[world.ADMIN=='Finland']

data = rasterio.open('Radar-suomi_dbz_eureffin.tif')

ax = finland.to_crs(data.read_crs().data).plot(zorder=0, color='gray')

show(data, transform=data.transform, ax=ax, zorder=3)
ax.axis('off')
