


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


ordered_freq_tab = function(var){
  tab = data.frame(table(var))
  tab = tab[order(tab$Freq, decreasing = T),]
  
  return(tab)
}


pretty_percentages = function(ratio){
  
  if(!is.numeric(ratio)){
    print('Input must be numeric')
  } else {
    return(round(ratio*100, 2))
  }
  
  
}


# wrapper for the combination lapply and do.call('rbind', object)
lapply_docall = function(list, fun){
  
  res = lapply(list, FUN = fun)
  
  res = do.call('rbind', res)
  
  return(res)
  
}


# generates random dataframe for testing stuff
generate_random_df = function(n_obs){
  
  data.frame(y = seq(2001, 2001+(n_obs-1)),
             a = sample(letters, 10),
             n = sample(1:10, 10))
  
}
