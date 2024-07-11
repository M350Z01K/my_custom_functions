library(sf)

# dev code ----
# path = '~/Documents/Private/bike_2022_2/'
# f = list.files(path, full.names = T)
# sf_tracks = lapply(f, function(x) st_read(dsn = x, layer = "tracks"))
# sf_tracks = do.call('rbind', sf_tracks)
# head(st_drivers())
# st_drivers()[grep('gpx', st_drivers()$long_name, ignore.case = T),]
# st_write(sf_tracks, driver = 'GPX', dsn = paste0(path, 'merged.gpx'))

# actual function ----
gpx_merger = function(input_files){
  
  if (length(input_files)<2){
    
    stop('at least two files are needed for mergin')
    
  } else {
    
    sf_tracks = lapply(input_files, function(x) st_read(dsn = x, layer = "tracks"))
    
    sf_tracks = do.call('rbind', sf_tracks)
    
    st_write(sf_tracks, driver = 'GPX', dsn = 'merged.gpx')
    
  }
  
}

setwd('my_functions/')
f = list.files(path = 'my_custom_functions/', pattern = '\\.gpx', full.names = T)
gpx_merger(f)
gpx = st_read(dsn = 'merged.gpx', layer = "tracks")
