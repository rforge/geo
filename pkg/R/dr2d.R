dr2d <-
function(dr, dlat = 1, dlon = 2, startLat = 50)
{
  hemi <- sign(dr + 1e-06)
  lat <- startLat + dlat*(abs(dr)%/%100)
  lon <- dlon*(dr%%(hemi*100))
  data.frame(lat = lat + dlat/2, lon =  lon + dlon/2)
}

