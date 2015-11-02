require(dplyr)
require(ggplot2)
require(tidyr)
require(reshape2)

train1_df <- read.csv("./Data/pml-training.csv")

base_df <- select(train1_df, one_of("X","user_name","classe"))
# keep only the index id, user_name, class, and accelarometer data
accel_df <-  cbind(base_df, select(train1_df, contains("accel")))

summary(accel_df)
# drop the var_ variables as they are mostly NA
accel_df <- select(accel_df, -starts_with("var_"))

#forearm
fore_df <-  cbind(base_df, select(accel_df, contains("fore")))
fore_pl <- ggplot(fore_df, aes(x=total_accel_forearm, fill=classe)) +
    geom_violin(aes(y=accel_forearm_x)) +
    facet_grid(.~classe)
print(fore_pl)

#arm
arm_df <-  cbind(base_df, select(accel_df, contains("_arm")))
arm_pl <- ggplot(arm_df, aes(x=total_accel_arm, fill=classe)) +
    geom_violin(aes(y=accel_arm_x)) +
    facet_grid(.~classe)
print(arm_pl)

#belt
belt_df <-  cbind(base_df, select(accel_df, contains("belt")))
belt_pl <- ggplot(belt_df, aes(x=total_accel_belt, fill=classe)) +
    geom_violin(aes(y=accel_belt_x)) +
    facet_grid(.~classe)
print(belt_pl)

#dumbbell
dumb_df <-  cbind(base_df, select(accel_df, contains("dumbbell")))
dumb_pl <- ggplot(dumb_df, aes(x=total_accel_dumbbell, fill=classe)) +
    geom_violin(aes(y=accel_dumbbell_x)) +
    facet_grid(.~classe)
print(dumb_pl)






# see if linear model for total and classe
# tot_df <- cbind(select(accel_df,classe), select(accel_df, starts_with("tot")))
# tb_pl <- qplot(classe, total_accel_belt, data=tot_df)
# print(tb_pl)
# tf_pl <- qplot(classe, total_accel_forearm, data=tot_df)
# print(tf_pl)
# ta_pl <- qplot(classe, total_accel_arm, data=tot_df)
# print(ta_pl)
# td_pl <- qplot(classe, total_accel_dumbbell, data=tot_df)
# print(td_pl)