output$display_propLevel_quiz = renderUI({
  quiz(caption="Proposition levels", 
       question("Glass fragments that were found inside the vehicle came from the broken window of the office.", 
                answer("Offence"), 
                answer("Activity"), 
                answer("Source", correct = TRUE), 
                answer("Sub-source") 
       ), 
       question("The suspect was present at the crime scene.",
                answer("Offence"), 
                answer("Activity"), 
                answer("Source", correct = TRUE), 
                answer("Sub-source") 
       )
  )
})