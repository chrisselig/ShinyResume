# Script is used to create the data for the dashboard

# Create Data for Plots ----
# Data Sets
tools_df <- tibble(
    skill = c("R", "SQL","Spotfire","Power BI", "Excel","Knime"),
    score = c(90,80,75, 75, 70,72)
)


skills_df <- tibble(
    skill = c("Data Visualization","Communication","Machine Learning", "Analysis", "Data Wrangling"),
    score = c(95,90, 80, 90, 94)
)

personality_tbl <- tibble(
    Analytical = c(20,0,16),
    Introvert = c(20,0,12),
    Curious = c(20,0,18),
    Motivated = c(20,0,16),
    Serious = c(20,0,6),
    Creative = c(20,0,8),
    Extrovert = c(20,0,4),
    Honest = c(20,0,18),
    Unmotivated = c(20,0,2),
    Humour = c(20,0,20)
)

write_rds(tools_df, "02_data/tools_df.rds")
write_rds(skills_df, "02_data/skills_df.rds")
write_rds(personality_tbl, "02_data/personality_tbl.rds")
