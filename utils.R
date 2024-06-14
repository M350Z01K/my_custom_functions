


# save to RDS only if file does not exist. 
# just prevents from overwriting a file when running a script multiple times.
safesaveRDS = function(obj, filename){

  
  if(file.exists(filename)){
    
    stop('file alreaedy exists')
    
  } else {
    
    saveRDS(obj, filename)
    
  }
  
}


str_to_vec = function(str_vec){
  
  # usage str_vec(letters)
  
  res = paste(shQuote(str_vec, type = 'csh'), collapse = ',')
  return(res)
}
