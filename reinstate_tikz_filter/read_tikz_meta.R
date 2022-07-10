read_tikz_metadata <- function(article_dir,file_name){
    src_file_data <- readLines(file.path(article_dir, file_name))
    fig_start <- which(grepl("^\\s*\\\\begin\\{figure", src_file_data))
    fig_end <- which(grepl("^\\s*\\\\end\\{figure", src_file_data))
    pre_fig <- src_file_data[seq_len(fig_start) - 1]
    post_fig <- src_file_data[seq_len(fig_end)]
    fig_data <- setdiff(post_fig, pre_fig)
    caption_line <- which(grepl("^\\s*\\\\caption\\{", fig_data))
    caption_data <- fig_data[caption_line]
    caption_text <- gsub("\\\\caption\\{|", "", caption_data)
    caption_raw_text <- stringr::str_match(
                    caption_text, "\\{\\s*(.*?)\\s*\\}")[ , 2]
    label_line <- which(grepl("^\\s*\\\\label\\{", fig_data))
    label_data <- fig_data[label_line]
    label_raw_text <- gsub("fig:", "",
                    gsub("[[:space:]]", "",
                    gsub("\\\\label\\{|\\}", "",
                    label_data)))
    # write caption and label into a temp_metadata file
    label_file_conn <- file("tikz_label_meta.txt")
    writeLines(paste(label_raw_text), label_file_conn)
    close(label_file_conn)
    caption_file_conn <- file("tikz_caption_meta.txt")
    writeLines(paste(caption_raw_text), caption_file_conn)
    close(caption_file_conn)
}