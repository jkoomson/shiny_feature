library("tidyverse")
library("shinyvalidate")


## ALTENATIVE

function(input, output, session) {

  level_map<-readRDS("data.RData")
  
  #validateInput
  text_validate<-InputValidator$new()
  text_validate$add_rule("name_custom", sv_required())
  text_validate$add_rule("custom", sv_required())


  observeEvent(input$combine, {
    
    text_validate$enable()
    req(input$custom)
    req(input$name_custom)
    
    if (input$name_custom != "") {

      text_validate$disable()

    }
    # 
    # 
    # if (is.null(input$custom)) {
    # 
    #   custom_validate$disable()
    # 
    # }

    level_map$Custom[level_map$Custom %in% c(input$custom)] <- input$name_custom
    
    updatePickerInput(session,
                      "filter",
                       choices = level_map$Origin)

    updatePickerInput(session,
                      "custom",
                       choices = sort(unique(level_map$Custom)))
  })

  observeEvent(input$revert_input, {
    text_validate$disable()
    updatePickerInput(session, "filter", choices = level_map$Origin)
    updatePickerInput(session, "custom", choices = level_map$Custom)
    updateTextInput(session, "name_custom", value = "")
  })
}



