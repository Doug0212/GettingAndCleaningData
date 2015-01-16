# Name: run_analysis.R
# Created by: Doug Nommisto
# Create date: 1/15/2015

# Set current local directory
#setwd("C:/DataScience/GettingandCleaningData/Project/Deliverables")

# Read Results_test and Results_train text files into variables
Results_test <- read.table("Results_test.txt", sep = "", header = FALSE)
Results_train <- read.table("Results_train.txt", sep = "", header = FALSE)

# Step 1 - Select mean and std columsn from Results_test and Results_train
Results_cols <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 
                       240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 
                       529:530, 542:543)
Results_test2 <- Results_test[, Results_cols]
Results_train2 <- Results_train[, Results_cols]

# Step 2 - Add the Subjects_test.txt file into the Results_test2.txt file as column 1.
Subjects_test <- read.table("Subjects_test.txt", sep = "", header = FALSE)
colnames(Subjects_test) <- "Subject"
Results_test2 <- cbind(Subjects_test, Results_test2)

# Step 3 - Add the Activities_test.txt file into the Results_test2.txt file as column 1.
Activities_test <- read.table("Activities_test.txt", sep = "", header = FALSE)
colnames(Activities_test) <- "Activity"
Results_test2 <- cbind(Activities_test, Results_test2)

# Step 4 - Add the Subjects_train.txt file into the Results_train2.txt file as column 1.
Subjects_train <- read.table("Subjects_train.txt", sep = "", header = FALSE)
colnames(Subjects_train) <- "Subject"
Results_train2 <- cbind(Subjects_train, Results_train2)

# Step 5 - Add the Activities_train.txt file into the Results_train2.txt file as column 1.
Activities_train <- read.table("Activities_train.txt", sep = "", header = FALSE)
colnames(Activities_train) <- "Activity"
Results_train2 <- cbind(Activities_train, Results_train2)

# Step 6 - Merge the Results_test2 and the Results_train2 data sets into a single data set 
# named Total_results.
Total_results <- rbind(Results_test2, Results_train2)

# Step 7 - Substitute formal activity names for the activity codes in column 1 of 
# Total_results
Total_results$Activity[Total_results$Activity == "1"] <- "WALKING"
Total_results$Activity[Total_results$Activity == "2"] <- "WALKING_UPSTAIRS"
Total_results$Activity[Total_results$Activity == "3"] <- "WALKING_DOWNSTAIRS"
Total_results$Activity[Total_results$Activity == "4"] <- "SITTING"
Total_results$Activity[Total_results$Activity == "5"] <- "STANDING"
Total_results$Activity[Total_results$Activity == "6"] <- "LAYING"

# Step 8 - Add column headings to Total_results
colnames(Total_results)[3] <- "Mean_X_Body_Accel_Tm"
colnames(Total_results)[4] <- "Mean_Y_Body_Accel_Tm"
colnames(Total_results)[5] <- "Mean_Z_Body_Accel_Tm"
colnames(Total_results)[6] <- "Std_X_Body_Accel_Tm"
colnames(Total_results)[7] <- "Std_Y_Body_Accel_Tm"
colnames(Total_results)[8] <- "Std_Z_Body_Accel_Tm"
colnames(Total_results)[9] <- "Mean_X_Gravity_Accel"
colnames(Total_results)[10] <- "Mean_Y_Gravity_Accel"
colnames(Total_results)[11] <- "Mean_Z_Gravity_Accel"
colnames(Total_results)[12] <- "Std_X_Gravity_Accel"
colnames(Total_results)[13] <- "Std_Y_Gravity_Accel"
colnames(Total_results)[14] <- "Std_Z_Gravity_Accel"
colnames(Total_results)[15] <- "Mean_X_Body_Accel_Jerk_Tm"
colnames(Total_results)[16] <- "Mean_Y_Body_Accel_Jerk_Tm"
colnames(Total_results)[17] <- "Mean_Z_Body_Accel_Jerk_Tm"
colnames(Total_results)[18] <- "Std_X_Body_Accel_Jerk_Tm"
colnames(Total_results)[19] <- "Std_Y_Body_Accel_Jerk_Tm"
colnames(Total_results)[20] <- "Std_Z_Body_Accel_Jerk_Tm"
colnames(Total_results)[21] <- "Mean_X_Body_Gyro_Tm"
colnames(Total_results)[22] <- "Mean_Y_Body_Gyro_Tm"
colnames(Total_results)[23] <- "Mean_Z_Body_Gyro_Tm"
colnames(Total_results)[24] <- "Std_X_Body_Gyro_Tm"
colnames(Total_results)[25] <- "Std_Y_Body_Gyro_Tm"
colnames(Total_results)[26] <- "Std_Z_Body_Gyro_Tm"
colnames(Total_results)[27] <- "Mean_X_Body_Gyro_Jerk_Tm"
colnames(Total_results)[28] <- "Mean_Y_Body_Gyro_Jerk_Tm"
colnames(Total_results)[29] <- "Mean_Z_Body_Gyro_Jerk_Tm"
colnames(Total_results)[30] <- "Std_X_Body_Gyro_Jerk_Tm"
colnames(Total_results)[31] <- "Std_Y_Body_Gyro_Jerk_Tm"
colnames(Total_results)[32] <- "Std_Z_Body_Gyro_Jerk_Tm"
colnames(Total_results)[33] <- "Mean_Body_Accel_Mag_Tm"
colnames(Total_results)[34] <- "Std_Body_Accel_Mag_Tm"
colnames(Total_results)[35] <- "Mean_Gravity_Accel_Mag"
colnames(Total_results)[36] <- "Std_Gravity_Accel_Mag"
colnames(Total_results)[37] <- "Mean_Body_Accel_Jerk_Mag_Tm"
colnames(Total_results)[38] <- "Std_Body_Accel_Jerk_Mag_Tm"
colnames(Total_results)[39] <- "Mean_Body_Gyro_Mag"
colnames(Total_results)[40] <- "Std_Body_Gyro_Mag"
colnames(Total_results)[41] <- "Mean_Body_Gyro_Jerk_Mag"
colnames(Total_results)[42] <- "Std_Body_Gyro_Jerk_Mag"
colnames(Total_results)[43] <- "Mean_X_Body_Accel"
colnames(Total_results)[44] <- "Mean_Y_Body_Accel"
colnames(Total_results)[45] <- "Mean_Z_Body_Accel"
colnames(Total_results)[46] <- "Std_X_Body_Accel"
colnames(Total_results)[47] <- "Std_Y_Body_Accel"
colnames(Total_results)[48] <- "Std_Z_Body_Accel"
colnames(Total_results)[49] <- "Mean_X_Body_Accel_Jerk"
colnames(Total_results)[50] <- "Mean_Y_Body_Accel_Jerk"
colnames(Total_results)[51] <- "Mean_Z_Body_Accel_Jerk"
colnames(Total_results)[52] <- "Std_X_Body_Accel_Jerk"
colnames(Total_results)[53] <- "Std_Y_Body_Accel_Jerk"
colnames(Total_results)[54] <- "Std_Z_Body_Accel_Jerk"
colnames(Total_results)[55] <- "Mean_X_Body_Gyro"
colnames(Total_results)[56] <- "Mean_Y_Body_Gyro"
colnames(Total_results)[57] <- "Mean_Z_Body_Gyro"
colnames(Total_results)[58] <- "Std_X_Body_Gyro"
colnames(Total_results)[59] <- "Std_Y_Body_Gyro"
colnames(Total_results)[60] <- "Std_Z_Body_Gyro"
colnames(Total_results)[61] <- "Mean_Body_Accel_Mag"
colnames(Total_results)[62] <- "Std_Body_Accel_Mag"
colnames(Total_results)[63] <- "Mean_Body_Body_Accel_Jerk_Mag"
colnames(Total_results)[64] <- "Std_Body_Body_Accel_Jerk_Mag"
colnames(Total_results)[65] <- "Mean_Body_Body_Gyro_Mag"
colnames(Total_results)[66] <- "Std_Body_Body_Gyro_Mag"
colnames(Total_results)[67] <- "Mean_Body_Body_Gyro_Jerk_Mag"
colnames(Total_results)[68] <- "Std_Body_Body_Gyro_Jerk_Mag"

# Step 9 - Using the Total_Results data set as input create a new file named 
# Average_results.txt which averages each variable in columns 3 through 68 
# by column 1 (Activity) and column 2 (Subject).
Average_results <- group_by(Total_results, Activity, Subject)
Average_results <- summarize(Average_results, 
                             Mean_X_Body_Accel_Tm = mean(Mean_X_Body_Accel_Tm, na.rm = T),
                             Mean_Y_Body_Accel_Tm = mean(Mean_Y_Body_Accel_Tm , na.rm = T),
                             Mean_Z_Body_Accel_Tm = mean(Mean_Z_Body_Accel_Tm , na.rm = T),                              
                             Std_X_Body_Accel_Tm = mean(Std_X_Body_Accel_Tm , na.rm = T),                               
                             Std_Y_Body_Accel_Tm = mean(Std_Y_Body_Accel_Tm , na.rm = T),                               
                             Std_Z_Body_Accel_Tm = mean(Std_Z_Body_Accel_Tm , na.rm = T), 
                             Mean_X_Gravity_Accel = mean(Mean_X_Gravity_Accel , na.rm = T), 
                             Mean_Y_Gravity_Accel = mean(Mean_Y_Gravity_Accel , na.rm = T), 
                             Mean_Z_Gravity_Accel = mean(Mean_Z_Gravity_Accel , na.rm = T), 
                             Std_X_Gravity_Accel = mean(Std_X_Gravity_Accel , na.rm = T), 
                             Std_Y_Gravity_Accel = mean(Std_Y_Gravity_Accel , na.rm = T), 
                             Std_Z_Gravity_Accel = mean(Std_Z_Gravity_Accel , na.rm = T), 
                             Mean_X_Body_Accel_Jerk_Tm = mean(Mean_X_Body_Accel_Jerk_Tm , na.rm = T), 
                             Mean_Y_Body_Accel_Jerk_Tm= mean(Mean_Y_Body_Accel_Jerk_Tm , na.rm = T), 
                             Mean_Z_Body_Accel_Jerk_Tm = mean(Mean_Z_Body_Accel_Jerk_Tm , na.rm = T), 
                             Std_X_Body_Accel_Jerk_Tm = mean(Std_X_Body_Accel_Jerk_Tm , na.rm = T), 
                             Std_Y_Body_Accel_Jerk_Tm = mean(Std_Y_Body_Accel_Jerk_Tm , na.rm = T), 
                             Std_Z_Body_Accel_Jerk_Tm = mean(Std_Z_Body_Accel_Jerk_Tm , na.rm = T), 
                             Mean_X_Body_Gyro_Tm = mean(Mean_X_Body_Gyro_Tm , na.rm = T), 
                             Mean_Y_Body_Gyro_Tm = mean(Mean_Y_Body_Gyro_Tm , na.rm = T), 
                             Mean_Z_Body_Gyro_Tm = mean(Mean_Z_Body_Gyro_Tm , na.rm = T), 
                             Std_X_Body_Gyro_Tm = mean(Std_X_Body_Gyro_Tm , na.rm = T), 
                             Std_Y_Body_Gyro_Tm = mean(Std_Y_Body_Gyro_Tm , na.rm = T), 
                             Std_Z_Body_Gyro_Tm = mean(Std_Z_Body_Gyro_Tm , na.rm = T), 
                             Mean_X_Body_Gyro_Jerk_Tm = mean(Mean_X_Body_Gyro_Jerk_Tm , na.rm = T), 
                             Mean_Y_Body_Gyro_Jerk_Tm = mean(Mean_Y_Body_Gyro_Jerk_Tm , na.rm = T), 
                             Mean_Z_Body_Gyro_Jerk_Tm = mean(Mean_Z_Body_Gyro_Jerk_Tm , na.rm = T), 
                             Std_X_Body_Gyro_Jerk_Tm = mean(Std_X_Body_Gyro_Jerk_Tm , na.rm = T), 
                             Std_Y_Body_Gyro_Jerk_Tm = mean(Std_Y_Body_Gyro_Jerk_Tm , na.rm = T), 
                             Std_Z_Body_Gyro_Jerk_Tm = mean(Std_Z_Body_Gyro_Jerk_Tm , na.rm = T), 
                             Mean_Body_Accel_Mag_Tm = mean(Mean_Body_Accel_Mag_Tm , na.rm = T), 
                             Std_Body_Accel_Mag_Tm = mean(Std_Body_Accel_Mag_Tm , na.rm = T), 
                             Mean_Gravity_Accel_Mag = mean(Mean_Gravity_Accel_Mag , na.rm = T), 
                             Std_Gravity_Accel_Mag = mean(Std_Gravity_Accel_Mag , na.rm = T), 
                             Mean_Body_Accel_Jerk_Mag_Tm = mean(Mean_Body_Accel_Jerk_Mag_Tm , na.rm = T), 
                             Std_Body_Accel_Jerk_Mag_Tm = mean(Std_Body_Accel_Jerk_Mag_Tm , na.rm = T), 
                             Mean_Body_Gyro_Mag = mean(Mean_Body_Gyro_Mag , na.rm = T),
                             Std_Body_Gyro_Mag = mean(Std_Body_Gyro_Mag , na.rm = T), 
                             Mean_Body_Gyro_Jerk_Mag = mean(Mean_Body_Gyro_Jerk_Mag , na.rm = T), 
                             Std_Body_Gyro_Jerk_Mag = mean(Std_Body_Gyro_Jerk_Mag , na.rm = T), 
                             Mean_X_Body_Accel = mean(Mean_X_Body_Accel , na.rm = T), 
                             Mean_Y_Body_Accel = mean(Mean_Y_Body_Accel , na.rm = T), 
                             Mean_Z_Body_Accel = mean(Mean_Z_Body_Accel , na.rm = T), 
                             Std_X_Body_Accel = mean(Std_X_Body_Accel , na.rm = T), 
                             Std_Y_Body_Accel = mean(Std_Y_Body_Accel , na.rm = T), 
                             Std_Z_Body_Accel = mean(Std_Z_Body_Accel , na.rm = T), 
                             Mean_X_Body_Accel_Jerk = mean(Mean_X_Body_Accel_Jerk , na.rm = T), 
                             Mean_Y_Body_Accel_Jerk = mean(Mean_Y_Body_Accel_Jerk , na.rm = T), 
                             Mean_Z_Body_Accel_Jerk = mean(Mean_Z_Body_Accel_Jerk , na.rm = T), 
                             Std_X_Body_Accel_Jerk = mean(Std_X_Body_Accel_Jerk , na.rm = T), 
                             Std_Y_Body_Accel_Jerk = mean(Std_Y_Body_Accel_Jerk , na.rm = T), 
                             Std_Z_Body_Accel_Jerk = mean(Std_Z_Body_Accel_Jerk , na.rm = T), 
                             Mean_X_Body_Gyro = mean(Mean_X_Body_Gyro , na.rm = T), 
                             Mean_Y_Body_Gyro = mean(Mean_Y_Body_Gyro , na.rm = T), 
                             Mean_Z_Body_Gyro = mean(Mean_Z_Body_Gyro , na.rm = T), 
                             Std_X_Body_Gyro = mean(Std_X_Body_Gyro , na.rm = T), 
                             Std_Y_Body_Gyro = mean(Std_Y_Body_Gyro , na.rm = T), 
                             Std_Z_Body_Gyro = mean(Std_Z_Body_Gyro , na.rm = T), 
                             Mean_Body_Accel_Mag = mean(Mean_Body_Accel_Mag , na.rm = T), 
                             Std_Body_Accel_Mag = mean(Std_Body_Accel_Mag , na.rm = T), 
                             Mean_Body_Body_Accel_Jerk_Mag = mean(Mean_Body_Body_Accel_Jerk_Mag , na.rm = T), 
                             Std_Body_Body_Accel_Jerk_Mag = mean(Std_Body_Body_Accel_Jerk_Mag , na.rm = T), 
                             Mean_Body_Body_Gyro_Mag = mean(Mean_Body_Body_Gyro_Mag , na.rm = T), 
                             Std_Body_Body_Gyro_Mag = mean(Std_Body_Body_Gyro_Mag , na.rm = T), 
                             Mean_Body_Body_Gyro_Jerk_Mag = mean(Mean_Body_Body_Gyro_Jerk_Mag , na.rm = T), 
                             Std_Body_Body_Gyro_Jerk_Mag = mean(Std_Body_Body_Gyro_Jerk_Mag , na.rm = T) 
                             ) 
write.table(Average_results, "Average_results.txt", row.name = F, sep = ",")




