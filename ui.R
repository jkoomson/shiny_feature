
library(shiny)
library(bs4Dash)
#library(shinyalert)
library(shinyWidgets)
library(shinyvalidate)

level_map<-readRDS("data.RData")

dashboardPage(
  
  #Load Data
  
  dark =FALSE,
  help =FALSE,
  fullscreen = TRUE,
  header = dashboardHeader(title = "Lincoln F Assessment"),
  footer = dashboardFooter(""),
  sidebar= dashboardSidebar(
    fixed = TRUE,
    skin = "light",
    #status = "primary",
    elevation = 3,
    id = "sidebar",
    customArea = fluidRow(
      actionButton(
        inputId = "myAppButton",
        label = NULL,
        icon = icon("users"),
        width = NULL,
        status = "primary",
        style = "margin: auto",
        dashboardBadge(textOutput("btnVal"), color = "danger")
      ))
   
  ),
  dashboardBody(
    div(
      id = "Name",
      fluidRow(
        bs4InfoBox(
          title = "XY",
          #value = textOutput("mort_amt"),
          icon = icon("envelope"),
          color = "orange",
          width = 3,
          elevation = 3,
          iconElevation = 0
        ),
        bs4InfoBox(
          title = "XX",
          # value = textOutput("ben_paid"),
          icon = icon("list-alt"),
          width = 3,
          elevation = 3,
          iconElevation = 0,
          color = "navy"
        ),
        bs4InfoBox(
          title = "XZ",
          #value = textOutput("lapse_expo"),
          icon = icon("stopwatch"),
          width = 3,
          elevation = 3,
          iconElevation = 0,
          color = "danger"
        ),
        bs4InfoBox(
          title = "zZ",
          #value = textOutput("lapse_expo"),
          icon = icon("user"),
          width = 3,
          elevation = 3,
          iconElevation = 0,
          color = "success"
        )
      ), 
      
      fluidRow(
        column(width = 12,
               box(title = "Data Plots  ")
               ),
        column(width = 12,
               box(title = "Data Tables ")
        )
      )
    ),
      bs4Card(
           itle = " Filter Summary",
           width = 6,
           collapsible = TRUE,
           maximizable = TRUE,
    #tagList()
      div(
             style = "float: left; width: 25%; padding-right: 1%; padding-top: 1%;",
             pickerInput("filter",
                     "Filter",
                     choices =unique(level_map$Origin))
             ),
      div( 
          style = "float: left; width: 25%; padding-right: 1%; padding-top: 1%;",
          pickerInput("custom",
                     "Customize",
                      choices = unique(level_map$Custom), multiple = T)
          ),
      div(
           style = "float: left; width: 25%; padding-right: 1%; padding-top: 1%;",
           textInput("name_custom",
                   "Name Custom Level")
           ),
      div(
          actionButton("combine", "Combine",
                       #style = "position: left; width: 30%; padding-right: 1%; padding-top: 1%;"
                       ),

          actionButton("revert_input", "Reset Buttons",
                       #style = "position:  right; width: 30%; padding-right: 1%; padding-top: 1%;"
      )
     )      # useShinyalert(force = TRUE)
    )
  )
)
