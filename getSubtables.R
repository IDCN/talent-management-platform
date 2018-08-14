#Construct a table consisting of all active IDCN partners. NOTE: without the code is.na(`Status comments`), R will drop any member for whom there is an empty status comment.
TMP_active <- dplyr::filter(TMP, TMP[,10] == "Active", TMP[,43] != "Account rejected" | is.na(TMP[,43]))

#Construct a table consisting of all inactive IDCN partners.
TMP_inactive <- dplyr::filter(TMP, TMP[,10] == "Inactive", TMP[,43] != "Account rejected" | is.na(TMP[,43])) 

#Construct a table consisting of all inactive IDCN partners who found a job. Since the values of `Status comments` that correspond to people who found a job consist of strings of the form "Job - <substring>", we are interested in isolating the substring "Job" to locate these people.
TMP_employed <- dplyr::filter(TMP_inactive, grepl('Job', TMP_inactive[,43]))

TMP_employed_corporate <- dplyr::filter(TMP_employed, grepl('Corporate', TMP_employed[,43]))

names(TMP_employed_corporate)

#Create a frequency table of partners employed at corporations.
count_partners_employed_corporate <- 
  group_by(
    TMP_employed_corporate, 
    str_match(TMP_employed_corporate[,43], '20\\d\\d')
    ) %>% summarize(count = n())

#RENAME COLUMN HEADERS
TMP_employed_other <- dplyr::filter(TMP_employed, !grepl('Corporate', TMP_employed[,43]))

#Create a frequency table of partner employed at companies that are not corporations.
count_partners_employed_other <- 
  group_by(
    TMP_employed_other, 
    str_match(TMP_employed_other[,43], '20\\d\\d')
    ) %>% summarize(count = n())

#Constructs a table consisting of all relocated IDCN partners.
TMP_relocated <- dplyr::filter(TMP, TMP[,10] == "Inactive", TMP[,43] == "Relocation") 

#Constructs a table consisting of all individuals who attempted to join IDCN but were rejected.
TMP_rejected <- dplyr::filter(TMP, TMP[,43] == "Account rejected")

#################################
#SUBTABLES FOR OTHER TEAMS
#################################

#Active partners' names, ordered by surname
TMP_active_names <- TMP_active_nonempty[,1:2]
TMP_active_names_s <- TMP_active_names[order(TMP_active_names[,2]),]
TMP_active_names_s <- TMP_active_names_s[,1:2]
write.xlsx(TMP_active_names_s, 
           file.path(getReportDir, "TMP_active_names_s",".xlsx"), 
           row.names = FALSE)

#Active partners' names and emails
TMP_active_namesmails <- TMP_active_nonempty[, c(1:2,5)]
TMP_active_namesmails <- TMP_active_namesmails[order(TMP_active_namesmails[,2]),]
write.xlsx(TMP_active_namesmails, 
           file.path(getReportDir, "TMP_active_namesmails",".xlsx"),
           sheetName = "Active Partner Emails", 
           row.names = FALSE)

names(TMP_active_nonempty)

#Volunteers List
volunteer_columns <- TMP[,c(1,2,5,10,33,34,36,37,38,44)]

TMP_volunteers <- dplyr::filter(volunteer_columns, volunteer_columns[,6]!="-")

#Active Volunteers List
TMP_volunteers_active <- dplyr::filter(TMP_volunteers, TMP_volunteers[,4]=="Active" & TMP_volunteers[,8]=="0000-00-00")
TMP_volunteers_active <- TMP_volunteers_active[,c(1,2,3,6,7)]
write.xlsx(TMP_volunteers_active,
           file.path(getReportDir, "TMP_volunteers_active",".xlsx"),
           sheetName = "Active Volunteers", 
           row.names = FALSE)


#Candidate Volunteers List
TMP_volunteers_candidates <- dplyr::filter(volunteer_columns,
                                           volunteer_columns[,4]=="Active",
                                           volunteer_columns[,5]=="Yes",
                                           volunteer_columns[,6]=="-")
write.xlsx(TMP_volunteers_candidates, 
           file.path(getReportDir, "TMP_volunteers_candidates",".xlsx"), 
           sheetName = "Candidate Volunteers", 
           row.names = FALSE)

#Candidate Volunteer Lists by Team
names(TMP_volunteers_candidates)

TMP_volunteers_candidates_split <- TMP_volunteers_candidates
stack <- strsplit(TMP_volunteers_candidates_split[,9], split = c(","))
L = sapply(stack, length)
TMP_volunteers_candidates_split <- data.frame(
  First = rep(TMP_volunteers_candidates_split[,1], L),
  Last = rep(TMP_volunteers_candidates_split[,2], L), 
  Email = rep(TMP_volunteers_candidates_split[,3], L),
  Joined = rep(TMP_volunteers_candidates_split[,10], L),
  Team = unlist(stack),
  stringsAsFactors=TRUE
)

TMP_volunteers_candidates_split[,5] <- gsub(" ", "", TMP_volunteers_candidates_split[,5])
TMP_volunteers_candidates_split[,5] <- gsub("/", "", TMP_volunteers_candidates_split[,5])
TMP_volunteers_candidates_split[,5] <- gsub("-", "None", TMP_volunteers_candidates_split[,5])

teams <- unique(TMP_volunteers_candidates_split[,5])

for(team in teams){
  team_list <- dplyr::filter(TMP_volunteers_candidates_split, 
                             TMP_volunteers_candidates_split[,5]==team)
  write.xlsx(team_list, 
             file.path(getReportDir, paste("TMP_volunteers_candidates",team,sep="_"),".xlsx"), 
             sheetName = team, 
             row.names = FALSE)
}
