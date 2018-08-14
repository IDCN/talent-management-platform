# Copyright (c) 2018 Jon Middleton. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =============================================================================

#Custom themes for job reports.
IDCNtheme_bar_dense <- theme(
  text=element_text(family="Corbel"),
  axis.text.x = element_text(angle = 45, hjust = 1),
  plot.margin = margin(0.5,0.5,1,3, "cm")
)

IDCNtheme_grouped_dense <- theme(
  text=element_text(family="Corbel"),
  axis.text.x = element_text(angle = 45, hjust = 1),
  plot.margin = margin(0.5,0.5,1,3, "cm")
)

IDCNtheme_grouped_dense_silent <- theme(
  text=element_text(family="Corbel"),
  axis.text.x = element_text(color = "white", hjust = 1),
  plot.margin = margin(0.5,0.5,1,3, "cm")
)

jobreport_basic <- function(table, N)
{
  #Group
  table <- table %>%
    group_by(Desired) %>%
    summarize(n())
  
  #Order
  table <- arrange(table, desc(`n()`))
  
  #Response label
  response_count <- sum(table$`n()`)
  
  #Sample size label
  samplesize <- paste("(N = ", sum(table$`n()`), ")", sep="")
  
  #Basic barplot
  ggplot(
    table[which(table$`n()`>N),], 
    aes(x=reorder(Desired,-`n()`), y=`n()`)
  ) +
    IDCNtheme_bar_dense +
    xlab(paste("Number of Active Members: ", 
               member_count, 
               "\n", 
               "Number of Responses: ", 
               response_count, sep=""
               )
         ) +
    ylab("Number of IDCN Members") +
    ggtitle(
      paste(desired_title("Industries"), 
            "\n",
            today, 
            sep = ""
            )
    ) +
    geom_text(aes(label=`n()`, y=`n()`+5), vjust=1, family="Corbel") +
    geom_col(width = 0.5, fill="#038080")
}
#print(jobreport_basic(A,20))

#Stacked barplot of IDCN Copenhagen's desired job placements.
jobreport_stacked <- function(table, N)
{  
  #Group
  table <- table %>%
    group_by(Education, Desired) %>%
    summarize(n())
  
  #Order
  table <- arrange(table[which(table$`n()`>N &
                                 table$`Desired`!="(No Response)" &
                                 table$Education!="(No Response)" &
                                 table$Education!="High School" &
                                 table$Education!="Other"
                               ), 
                         ],
                   desc(`n()`)
                   )
  
  #Response label
  response_count <- sum(table$`n()`)
  
  #Sample size label
  samplesize <- paste("(N = ", sum(table$`n()`), ")", sep="")
  
  #Stacked barplot
  ggplot(table, 
         aes(fill=Education, 
             x=reorder(Desired,-`n()`),
             y=`n()`, 
             label = `n()`)
         ) +
    scale_fill_manual(values = paletteIDCN) +
    IDCNtheme_grouped_dense +
    xlab(paste("Number of Active Members: ", member_count, sep="")) +
    ylab("Number of IDCN Members") +
    ggtitle(paste(desired_title("Job Fields"), "\n", today, sep = "")) +
    geom_col() +
    geom_text(size=5, position = position_stack(vjust = 0.5), family= "Corbel", color = "white")
}

#print(jobreport_stacked(A,2))
#print(jobreport_stacked(A1,2))

#Grouped barplot of IDCN Copenhagen's desired job placements.
jobreport_grouped <- function(table, N)
{
  #Group
  table <- table %>%
    group_by(Education, Desired) %>%
    summarize(n())
  
  #Order
  table <- arrange(table, desc(`n()`))
  
  #Response label
  response_count <- sum(table$`n()`)
  
  #Sample size label
  samplesize <- paste("(N = ", sum(table$`n()`), ")", sep="")
  
  #Grouped barplot
  ggplot(table[which(table$`n()`>N),],
         aes(fill=Education, 
             x=reorder(Desired,-`n()`), 
             y=`n()`)
         ) +
    scale_fill_manual(values = paletteIDCN) +
    IDCNtheme_grouped_dense +
    xlab(paste("Number of Active Members: ", 
               member_count, 
               "\n", 
               "Number of Responses: ", 
               response_count, 
               sep="")
         ) +
    ylab("Number of IDCN Members") +
    ggtitle(paste(desired_title("Professional Areas"), 
                  "\n",
                  today, 
                  sep = ""
                  )
            )+
    geom_col(position="dodge")  
}

#print(jobreport_grouped(A,1))
#print(jobreport_grouped(A1,1))

#Restricted barplot of IDCN Copenhagen's desired job placements.
jobreport_restricted <- function(table, N)
{  
  #Group
  table <- table %>%
    group_by(Education, Desired) %>%
    summarize(n())
  
  #Order
  table <- arrange(table, desc(`n()`))
  
  #Response label
  response_count <- sum(table$`n()`)
  
  #Restricted grouped barplot
  ggplot(table[which(table$`n()`>N),], 
         aes(fill=Education, 
             x=reorder(Desired,-`n()`), 
             y=`n()`)
         ) +
    scale_fill_manual(values = paletteIDCN) +
    IDCNtheme_grouped_dense +
    xlab(paste("Number of Active Members: ", 
               member_count, 
               "\n", 
               "Number of Responses: ", 
               response_count, 
               sep=""
               )
         ) +
    ylab("Number of IDCN Members") +
    ggtitle(paste(desired_title("Professional Areas"), 
                  "\n",
                  today, 
                  sep = ""
                  )
            ) +
    geom_bar(position="dodge", stat="identity") 
}

#print(jobreport_restricted(A,1))
#print(jobreport_restricted(A1,1))

jobreport_fieldplot <- function(table, string)
{  
  #Group
  table <- table %>%
    group_by(Education, Desired) %>%
    summarize(n())
  
  #Order
  table <- arrange(table, desc(`n()`))
  
  #Restricted table
  r_table <- table[which(table$Desired==string),]
  
  #Sample size label
  response_count <- sum(r_table$`n()`)
  
  #Restricted grouped barplot
  ggplot(
    r_table, 
    aes(
      fill=Education, 
      x=reorder(Desired,-`n()`), 
      y=`n()`,
      label=`n()`
    )
  ) +
    scale_fill_manual(values = paletteIDCN) +
    IDCNtheme_grouped_dense_silent +
    xlab(paste("Total: ", response_count, sep="")) +
    ylab("Number of IDCN Members") +
    ggtitle(
      paste("Active IDCN Copenhagen Members Interested in ", 
            string, 
            sep = "")
    ) +
    geom_text(position = position_dodge(width=0.9),
              size = 7,
              family = "Corbel",
              aes( 
                y=2 +`n()`, 
                label=`n()`,
                hjust=0.5, #hjust=0.5 corresponds to centered text
                colour = Education # indicates a color palette for the bar numbers
                ) 
    ) +
    scale_color_manual(values = paletteIDCN) + #resets the color palette for the bar numbers to a custom palette +
    #annotate(size = 5, "text",x = Inf,y = Inf,label = samplesize, hjust = 1.5, vjust = 1.5) +
    geom_bar(aes(fill=Education), 
             position=position_dodge(width=0.9), 
             stat="identity"
             )
  #geom_col() 
}

#jobreport_fieldplot(A, levels(A[,4])[10])

