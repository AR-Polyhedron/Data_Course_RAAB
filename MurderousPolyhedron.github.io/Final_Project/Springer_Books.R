library(tidyverse)
devtools::install_github("renanxcortes/springerQuarantineBooksR", force = TRUE)
library(springerQuarantineBooksR)


dir.create("~/Desktop/Springer_Books/")
######## Add BookLists.xlsx to this new directory before proceeding!!!


# modified function
download_springer_table <-
  function(lan = 'eng') {
    
    if (!(lan %in% c('eng', 'ger'))) { stop("'lan' should be either 'eng' or 'ger'.") }
    
    `%>%` <- magrittr::`%>%`
    
    if (lan == 'eng') {
      
      books_list_url <- 'https://resource-cms.springernature.com/springer-cms/rest/v1/content/17858272/data/v6/'
      tf <- list.files(file.path(getwd()),pattern = "BookList.xlsx",full.names = TRUE)
      springer_table <- read_excel(tf) %>%
        clean_names()
      
    }
    
    return(springer_table)
    
  }


#modified function
download_springer_book_files <- function(springer_books_titles = NA, destination_folder = 'springer_quarantine_books', lan = 'eng', filetype = 'pdf') {
  
  if (!(filetype %in% c('pdf', 'epub', 'both'))) { stop("'filetype' should be 'pdf', 'epub' or 'both'.") }
  
  `%>%` <- magrittr::`%>%`
  
  # springer_table <- download_springer_table(lan = lan)
  
  if (is.na(springer_books_titles)) {
    springer_books_titles <- springer_table %>%
      clean_names() %>%
      pull(.data$book_title) %>%
      unique()
  }
  
  n <- length(springer_books_titles)
  
  i <- 1
  
  message("Downloading title latest editions.")
  
  for (title in springer_books_titles) {
    
    message(paste0('Processing... ', title, ' (', i, ' out of ', n, ')'))
    
    book_type <-
      springer_table %>%
      filter(.data$book_title == title) %>%
      { if(lan == 'eng') pull(., .data$english_package_name) else .} %>%
      { if(lan == 'ger') pull(., .data$german_package_name) else .} %>%
      unique()
    
    current_folder = file.path(destination_folder, book_type)
    if (!dir.exists(current_folder)) { dir.create(current_folder, recursive = T) }
    
    setwd(current_folder)
    t0 <- Sys.time()
    
    if(filetype == 'pdf' || filetype == 'epub') {
      download_springer_book(title, springer_table, filetype)
    }
    if (filetype == 'both') {
      download_springer_book(title, springer_table, 'pdf')
      download_springer_book(title, springer_table, 'epub')
    }
    
    print(paste0('Time processed: ', round(Sys.time() - t0, 2), ' sec elapsed'))
    setwd(file.path('.', '..', '..'))
    
    i <- i + 1
    
  }
  
}



setwd("~/Desktop/Springer_Books/")
download_springer_book_files(filetype = "both")
