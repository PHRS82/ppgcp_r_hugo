times <- c("a", "b", "c", "d", "a", "a", "b")
recode <- c("palmeirenses" = "a", 
            "corinthianos" = "b", 
            "são paulinos" = "c", 
            "santistas" = "d")
times <- factor(times, levels = recode, labels = names(recode))
times <- relevel(times, ref = "santistas")
