text_v <- scan("data/text/melville.txt", what = "character", sep = "\n") 
start_v <- which(text_v == "CHAPTER 1. Loomings.")
novel_lines_v <- text_v[start_v:length(text_v)]
novel_v <- paste(novel_lines_v, collapse = " ")
novel_lower_v <- tolower(novel_v)
moby_words_l <- strsplit(novel_lower_v, "\\W")
moby_word_v <- unlist(moby_words_l) 
not_blanks_v <- which(moby_word_v != "") 
moby_word_v <- moby_word_v[not_blanks_v]
n_time_v <- seq(from = 1, to = length(moby_word_v))
whales_v <- which(moby_word_v == "whale")
whales_v
w_count_v <- rep(NA, times = length(n_time_v))
w_count_v[whales_v] <- 1
plot(
  w_count_v,
  main = "Dispersion Plot of 'whale' in Moby Dick",
  xlab = "Novel Time",
  ylab = "whale",
  type = "h",
  ylim = c(0, 1), yaxt = 'n'
)
ahabs_v <- which(moby_word_v == "ahab") # find 'ahab'
a_count_v <- rep(NA, length(n_time_v))
# change 'w' to 'a' to keep whales and ahabs in separate variables 
a_count_v[ahabs_v] <- 1 # mark the occurrences with a 1
plot(
  a_count_v,
  main = "Dispersion Plot of 'ahab' in Moby Dick",
  xlab = "Novel Time",
  ylab = "ahab",
  type = "h",
  ylim = c(0, 1),
  yaxt = 'n'
)
whale_hits <- grep( "whale|whales|whale's|monster|leviathan", moby_word_v
)
ahab_hits <- grep( "ahab|ahabs|ahab's|captain", moby_word_v
)
length(whales_v); length(whale_hits)
length(ahabs_v); length(ahab_hits)
eg_v <- "this is a _test_ to see if we can keep ahab's and other words such as contractions like can't and ain't. it will also allow us to see some other oddities." 
strsplit(eg_v, "\\W")
strsplit(eg_v, "[^A-Za-z0-9']")
text_v <- scan("data/text/melville.txt", what = "character", sep = "\n") 
start_v <- which(text_v == "CHAPTER 1. Loomings.")
novel_lines_v <- text_v[start_v:length(text_v)]
novel_v <- paste(novel_lines_v, collapse=" ")
novel_lower_v <- tolower(novel_v)
moby_words_l <- strsplit(novel_lower_v, "[^A-Za-z0-9']") 
moby_word_v <- unlist(moby_words_l)
not_blanks_v <- which(moby_word_v != "")
moby_word_v <- moby_word_v[not_blanks_v]
whale_hits_new <- grep( 
  "whale|whales|whale's|monster|leviathan", 
  moby_word_v
  )
ahab_hits_new <- grep( 
  "ahab|ahabs|ahab's|captain", 
  moby_word_v
  )
length(whale_hits_new)
whale_varients_v <- moby_word_v[whale_hits_new] 
ahab_varients_v <- moby_word_v[ahab_hits_new]
sort(table(whale_varients_v), decreasing = TRUE)
sort(table(ahab_varients_v), decreasing = TRUE)
length(which(whale_varients_v == "whale"))
length(grep("whale", whale_varients_v))
length(grep("^whale$", whale_varients_v))
