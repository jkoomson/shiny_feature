bs4Card(
  itle = " Filter Summary",
  width = 6,
  collapsible = TRUE,
  maximizable = TRUE,
  #tagList()
  div(
    style = "float: left; width: 20%; padding-right: 1%; padding-top: 1%;",
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
    style = "float: left; width: 40%; padding-right: 1%; padding-top: 1%;",
    textInput("name_custom",
              "Name Custom Level")
  ),
  div(
    actionButton("combine", "Combine",
                 style = "position: relative; left; width: 40%; padding-right: 1%; padding-top: 1%;"
    ),
    
    actionButton("revert_input", "Reset Buttons",
                 style = "position: relative; right; width: 40%; padding-right: 1%; padding-top: 1%;"
    )
  )      # useShinyalert(force = TRUE)
)