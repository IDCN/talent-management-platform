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

#Theme for barplots topped with values. These are useful for displaying data about the part of the membership that is interested in a given sector of the economy.

themeIDCN <- function(){
  theme(
    axis.text.x = element_text(colour = "white", size=rel(1.5)),
    axis.title.x = element_text(colour = "white", size=rel(1.5)),
    axis.text.y = element_text(colour = "black", size=rel(1.5)),
    axis.title.y = element_text(colour = "black", size=rel(1.5)),
    #axis.title.y = element_text(colour = "blue", angle=45),
    panel.background = element_rect(fill="gray97"),
    panel.grid.minor = element_line(colour = "white"),
    panel.grid.major = element_line(colour = "white"),
    plot.background = element_rect(fill="white"),
    plot.title = element_text(colour = "black", size=rel(1.7)),
    legend.position = "left",
    text = element_text(family = "Corbel")
  )
}

themeIDCN_counts <- function(){
  theme(
    axis.text.x = element_text(colour = "white", size=rel(1.5)),
    axis.title.x = element_text(colour = "black", size=rel(1.5)),
    axis.text.y = element_text(colour = "black", size=rel(1.5)),
    axis.title.y = element_text(colour = "black", size=rel(1.5)),
    #axis.title.y = element_text(colour = "blue", angle=45),
    panel.background = element_rect(fill="gray97"),
    panel.grid.minor = element_line(colour = "white"),
    panel.grid.major = element_line(colour = "white"),
    plot.background = element_rect(fill="white"),
    plot.title = element_text(colour = "black", size=rel(1.7)),
    legend.position = "left",
    text = element_text(family = "Corbel")
  )
}

themeIDCN_monthly_report <- {
  theme(
    axis.text.x = element_text(colour = "black", size=rel(1.9)),
    axis.title.x = element_text(colour = "black", size=rel(1.9)),
    axis.text.y = element_text(colour = "black", size=rel(1.7)),
    axis.title.y = element_text(colour = "black", size=rel(1.9)),
    #axis.title.y = element_text(colour = "blue", angle=45),
    #panel.background = element_rect(fill="#87898b"),
    panel.grid.minor = element_line(colour = "white"),
    panel.grid.major = element_line(colour = "white"),
    plot.background = element_rect(fill="white"),
    plot.title = element_text(colour = "black", size=rel(2.2)),
    legend.position = "left",
    text = element_text(family = "Corbel")
  )
}

themeIDCN_monthly_report_noaxistitle <- {
  theme(
    axis.text.x = element_text(colour = "black", size=rel(1.9)),
    axis.title.x = element_text(colour = "black", size=rel(1.9)),
    axis.text.y = element_text(colour = "black", size=rel(1.7)),
    axis.title.y = element_blank(),
    #axis.title.y = element_text(colour = "blue", angle=45),
    #panel.background = element_rect(fill="#87898b"),
    panel.grid.minor = element_line(colour = "white"),
    panel.grid.major = element_line(colour = "white"),
    plot.background = element_rect(fill="white"),
    plot.title = element_text(colour = "black", size=rel(2.2)),
    legend.position = "left",
    text = element_text(family = "Corbel")
  )
}

themeIDCN_bar_angled <- {
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size=rel(1.9)),
    axis.text.y = element_text(hjust = 1, size=rel(1.7)),
    axis.title.x = element_text(colour = "white", size=rel(1.9)),
    axis.title.y = element_text(colour = "white", size=rel(1.9)),
    plot.margin = margin(0,0,0,2, "cm"),
    plot.title = element_text(colour = "black", size=rel(2.2)),
    text = element_text(family = "Corbel")
  )
}

themeIDCN_bar_angled_noaxistitle <- {
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size=rel(1.9)),
    axis.text.y = element_text(hjust = 1, size=rel(1.7)),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    plot.margin=grid::unit(c(0,0,0,0), "mm"),
    plot.title = element_text(colour = "black", size=rel(2.2)),
    text = element_text(family = "Corbel")
  )
}

paletteIDCN <- c("(No Response)" = "#e04a4a", 
                 "Master's Degree" = "#038080", 
                 "Bachelor's Degree" = "#00BEBE", 
                 "PhD/Doctorate" = "#074a4a", 
                 "High School" = "#558A8A", 
                 "Other" = "#7FC1C0"
                 )

