# Scripts used in Shiny Apps ----

# Plot Function for the tools
plot_function <- function(data){
    
    plot_plot <- data %>%  
        ggplot(aes(x = score, y = reorder(skill, score))) +
        geom_segment(aes(yend = skill), xend = 0, colour = "grey50", size = 1.25) +
        geom_point(size = 2) +
        theme_tufte() +
        labs(
            x = "",
            y = "",
            title = ""
        ) +
        theme(
            panel.grid.major.y = element_blank(),   # No horizontal grid lines
            axis.ticks = element_blank(),
            axis.text.x = element_blank(),
            axis.text.y = element_text(size=12)          # increase label text size
        ) +
        expand_limits(x = 0, y = 0)
        
    plot_plot <- plotly::ggplotly(plot_plot) %>% 
        config(displayModeBar = FALSE)
    
    return(plot_plot)
    
}


# Radar Plot ----

radar_plot <- function(data){
    
    radar_plot <- data %>% 
    radarchart(axistype=1, 
                
                #custom polygon
                pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
                
                #custom the grid
                cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
                
                #custom labels
                vlcex=1
    )
    
    return(radar_plot)
}