import 'package:MyGymPro/programheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';      


String exercise;
String reps;
String sets;
int maxLift;
double temp;
double temp2;
double temp3;
double temp4;

TextEditingController myController = TextEditingController();

class Workout extends StatefulWidget
{
  Workout({this.muscle, this.weekNum, this.difficulty});
  final String muscle;
  final int weekNum;
  final String difficulty;

  @override
  _WorkoutState createState() => new _WorkoutState(muscle: this.muscle, weekNum:this.weekNum, difficulty: this.difficulty);
}

class _WorkoutState extends State<Workout>{
  final String muscle;
  final int weekNum;
  final String difficulty;
  
  _WorkoutState( 
    {this.muscle, this.weekNum, this.difficulty}
  );

  void defineWorkout(String m, int week){
    switch(m)
    {
      case "CHEST":
      {
        if (difficulty == "Beginner")
        {
          if (week == 1)
          {
            exercise = " Machine Bench Press\n Incline Dumbell Press\n Push ups";
            sets = "3\n3\n3";
            reps = "3\n8\nBurnout";
          }
          else if(week == 2)
          {
            exercise = " Machine Bench Press\n Incline Dumbell Press\n Push ups";
            sets = "4\n4\n3";
            reps = "\n3\n8\nBurnout\n";
          }
          else if(week == 3)
          {
            exercise = " \n Machine Bench Press (+)\n Incline Dumbell Press (+)\n Push ups\n NEW: Dumbbell Fly";
            sets = "\n3\n3\n3\n2";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 4)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n4\n3\n4\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 5)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n3\n3\n4\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 6)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n4\n4\n4\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 7)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n4\n5\n5\n4";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 8)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n3\n3\n5\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else if(week == 9)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n4\n4\n5\n3";
            reps = "\n4\n8\nBurnout\n8";
          }
          else if(week == 10)
          {
            exercise = " \n Machine Bench Press\n Incline Dumbell Press\n Push ups\n Dumbbell Fly";
            sets = "\n3\n3\n5\n3";
            reps = "\n3\n8\nBurnout\n8";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Intermediate")
        {
          if (week == 1)
          {
            exercise = "\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n3\n3\n4\n3";
            reps = "\n8\n8\n15\n6";
          }
          else if(week == 2)
          {
            exercise = "\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n5\n3\n4\n3";
            reps = "\n5\n8\n15\n8";
          }
          else if(week == 3)
          {
            exercise = "\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n5\n4\n4\n3";
            reps = "\n6\n8\n15\n6";
          }
          else if(week == 4)
          {
            exercise = "\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n3\n3\n4\n3";
            reps = "\n8\n8\n15\n8";
          }
          else if(week == 5)
          {
            exercise = "\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n5\n3\n4\n3";
            reps = "\n5\n8\n15\n6";
          }
          else if(week == 6)
          {
            exercise = "\n\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly\n Push Ups";
            sets = "\n\n5\n3\n4\n3\n3";
            reps = "\n\n          6\n          8\n          15\n          8\n Burnout";
          }
          else if(week == 7)
          {
            exercise = "\n\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly\n Push Ups";
            sets = "\n\n3\n3\n4\n3\n3";
            reps = "\n\n          8\n          8\n          15\n          6\n Burnout";
          }
          else if(week == 8)
          {
            exercise = "\n\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly\n Push Ups";
            sets = "\n\n5\n3\n4\n3\n4";
            reps = "\n\n          5\n          8\n          15\n          6\n Burnout";
          }
          else if(week == 9)
          {
            exercise = "\n\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly\n Push Ups";
            sets = "\n\n5\n3\n4\n3\n4";
            reps = "\n\n          6\n          8\n          15\n          8\n Burnout";
          }
          else if(week == 10)
          {
            exercise = "\n\n Flat Bench Press\n Incline Dumbell Press\n Cable Cross Over\n Dumbbell Fly\n Push Ups";
            sets = "\n\n5\n3\n4\n3\n5";
            reps = "\n\n          7\n          8\n          15\n          6\n Burnout";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            exercise = "\n Flat Bench Press\n Incline Bench Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n\n3\n3\n4\n3\n";
            reps = "\n\n          8\n          8\n          15\n          6\n";
          }
          else if(week == 2)
          {
            exercise = "\n Flat Bench Press\n Incline Bench Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n\n5\n3\n4\n3\n";
            reps = "\n\n          5\n          10\n          15\n          8\n";
          }
          else if(week == 3)
          {
            exercise = "\n Flat Bench Press\n Incline Bench Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n\n5\n3\n4\n3\n";
            reps = "\n\n          6\n          8\n          15\n          6\n";
          }
          else if(week == 4)
          {
            exercise = "\n Flat Bench Press\n Incline Bench Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n\n3\n3\n4\n3\n";
            reps = "\n\n          8\n          10\n          15\n          8\n";
          }
          else if(week == 5)
          {
            exercise = "\n Flat Bench Press\n Incline Bench Press\n Cable Cross Over\n Dumbbell Fly";
            sets = "\n\n5\n3\n4\n3\n";
            reps = "\n\n          5\n          8\n          15\n          6\n";
          }
          else if(week == 6)
          {
            exercise = "\n\n Flat Bench Press\n Incline Bench Press\n Cable Cross Over\n Dumbbell Fly\n NEW: Push Ups";
            sets = "\n\n5\n3\n4\n3\n";
            reps = "\n\n          6\n          10\n          15\n          8\n Burn out";
          }
          else if(week == 7)
          {
            exercise = "\n\n Flat Bench Press\n Incline Bench Press\n NEW: Decline Bench Press\n Cable Cross Over\n Dumbbell Fly\n Push Ups";
            sets = "\n\n3\n3\n3\n4\n3\n3";
            reps = "\n\n          8\n          8\n          3\n          15\n          8\n Burn out";
          }
          else if(week == 8)
          {
            exercise = "\n\n Flat Bench Press\n Incline Bench Press\n Decline Bench Press\n Cable Cross Over\n Dumbbell Fly\n Push Ups";
            sets = "\n\n5\n3\n3\n4\n3\n3";
            reps = "\n\n          5\n          10\n          3\n          15\n          6\n Burn out";
          }
          else if(week == 9)
          {
            exercise = "\n\n Flat Bench Press\n Incline Bench Press\n Decline Bench Press\n Cable Cross Over\n Dumbbell Fly\n Push Ups";
            sets = "\n\n5\n3\n3\n4\n3\n4";
            reps = "\n\n          6\n          8\n          3\n          15\n          8\n Burn out";
          }
          else if(week == 10)
          {
            exercise = "\n\n Flat Bench Press\n Incline Bench Press\n Decline Bench Press\n Cable Cross Over\n Dumbbell Fly\n Push Ups";
            sets = "\n\n5\n3\n3\n4\n3\n5";
            reps = "\n\n          7\n          10\n          3\n          15\n          6\n Burn out";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      case "SHOULDERS":
      {
        if (difficulty == "Beginner")
        {
          if (week == 1)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "6\n8\n8";
          }
          else if (week == 2)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "8\n10\n10";
          }
          else if (week == 3)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "6\n8\n8";
          }
          else if (week == 4)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "8\n10\n10";
          }
          else if (week == 5)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "6\n8\n8";
          }
          else if (week == 6)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "8\n10\n10";
          }
          else if (week == 7)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "6\n8\n8";
          }
          else if (week == 8)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "8\n10\n10";
          }
          else if (week == 9)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "6\n8\n8";
          }
          else if (week == 10)
          {
            exercise = " Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises";
            sets = "3\n4\n4";
            reps = "8\n10\n10";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Intermediate")
        {
          if (week == 1)
          {
            exercise = " \n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n3\n4\n4\n3";
            reps = "\n6\n8\n8\n6";
          }
          else if (week == 2)
          {
            exercise = " \n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n3\n4\n4\n3";
            reps = "\n8\n10\n10\n8";
          }
          else if (week == 3)
          {
            exercise = " \n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n3\n5\n4\n3";
            reps = "\n10\n10\n10\n8";
          }
          else if (week == 4)
          {
            exercise = " \n\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls\n NEW: Cable Lateral Raises";
            sets = "\n\n3\n4\n4\n4\n4";
            reps = "\n\n6\n8\n8\n10\n6";
          }
          else if (week == 5)
          {
            exercise = " \n\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls\n Cable Lateral Raises";
            sets = "\n\n3\n4\n4\n3\n4";
            reps = "\n\n8\n10\n10\n8\n6";
          }
          else if (week == 6)
          {
            exercise = " \n\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls\n Cable Lateral Raises";
            sets = "\n\n3\n5\n4\n3\n4";
            reps = "\n\n10\n10\n10\n8\n6";
          }
          else if (week == 7)
          {
            exercise = " \n\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls\n Cable Lateral Raises";
            sets = "\n\n3\n4\n4\n4\n4";
            reps = "\n\n6\n8\n8\n10\n6";
          }
          else if (week == 8)
          {
            exercise = " \n\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls\n Cable Lateral Raises";
            sets = "\n\n3\n4\n4\n3\n4";
            reps = "\n\n8\n10\n10\n8\n6";
          }
          else if (week == 9)
          {
            exercise = " \n\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls\n Cable Lateral Raises";
            sets = "\n\n3\n5\n4\n3\n4";
            reps = "\n\n10\n10\n10\n8\n6";
          }
          else if (week == 10)
          {
            exercise = " \n\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls\n Cable Lateral Raises";
            sets = "\n\n3\n4\n4\n4\n4";
            reps = "\n\n6\n8\n8\n10\n6";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n6\n6\n8\n6\n6";
          }
          else if (week == 2)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n7\n8\n10\n10\n6";
          }
          else if (week == 3)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n6\n6\n8\n6\n6";
          }
          else if (week == 4)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n7\n8\n10\n10\n6";
          }
          else if (week == 5)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n6\n6\n8\n6\n6";
          }
          else if (week == 6)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n7\n8\n10\n10\n6";
          }
          else if (week == 7)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n6\n6\n8\n6\n6";
          }
          else if (week == 8)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n7\n8\n10\n10\n6";
          }
          else if (week == 9)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n6\n6\n8\n6\n6";
          }
          else if (week == 10)
          {
            exercise = " \n\n Barbell Overhead Press\n Dumbbell Overhead Press\n Standing Dumbbell Fly\n Dumbbell Front Raises\n Cable Face Pulls";
            sets = "\n\n3\n3\n4\n4\n3";
            reps = "\n\n7\n8\n10\n10\n6";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      case "BACK":
      {
        if (difficulty == "Beginner")
        {
            if (week == 1)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "6\nBurnout";
            }
            else if (week == 2)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "7\nBurnout";
            }
            else if (week == 3)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "8\nBurnout";
            }
            else if (week == 4)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "9\nBurnout";
            }
            else if (week == 5)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "6\nBurnout";
            }
            else if (week == 6)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "7\nBurnout";
            }
            else if (week == 7)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "8\nBurnout";
            }
            else if (week == 8)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "9\nBurnout";
            }
            else if (week == 9)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "6\nBurnout";
            }
            else if (week == 10)
            {
              exercise = " Seated Machine Rows\n Pull Ups";
              sets = "4\n3";
              reps = "7\nBurnout";
            }
            else
              {
                exercise = null;
                sets = null;
                reps = null;
              }
        }
        else if (difficulty == "Intermediate")
        {
          if (week == 1)
          {
            exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
            sets = "4\n4\n4";
            reps = "8\n6\nBurnout";
          }
          else if (week == 2)
          {
              exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
              sets = "4\n5\n4";
              reps = "9\n6\nBurnout";
          }
          else if (week == 3)
          {
            exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
            sets = "4\n5\n4";
            reps = "10\n6\nBurnout";
          }
          else if (week == 4)
          {
            exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
            sets = "4\n4\n4";
            reps = "8\n6\nBurnout";
          }
          else if (week == 5)
          {
            exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
            sets = "4\n5\n4";
            reps = "9\n6\nBurnout";
          }
          else if (week == 6)
          {
            exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
            sets = "4\n5\n4";
            reps = "10\n6\nBurnout";
          }
          else if (week == 7)
          {
            exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
            sets = "4\n4\n4";
            reps = "8\n6\nBurnout";
          }
          else if (week == 8)
          {
            exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
            sets = "4\n5\n4";
            reps = "9\n6\nBurnout";
          }
          else if (week == 9)
          {
            exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
            sets = "4\n5\n4";
            reps = "10\n6\nBurnout";
          }
          else if (week == 10)
          {
            exercise = " Dumbbell Single Arm Row\n Seated Machine Rows\n Pull Ups";
            sets = "4\n4\n4";
            reps = "8\n6\nBurnout";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n3\n4\n4\n3\n3";
            reps = "\n\n3\n6\n6\nBurntout\nBurnout";
          }
          else if (week == 2)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n3\n4\n4\n3\n3";
            reps = "\n\n4\n7\n7\nBurntout\nBurnout";
          }
          else if (week == 3)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n4\n4\n4\n3\n3";
            reps = "\n\n4\n8\n8\nBurntout\nBurnout";
          }
          else if (week == 4)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n3\n4\n4\n3\n3";
            reps = "\n\n3\n6\n6\nBurntout\nBurnout";
          }
          else if (week == 5)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n3\n4\n4\n3\n3";
            reps = "\n\n4\n7\n7\nBurntout\nBurnout";
          }
          else if (week == 6)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n4\n4\n4\n3\n3";
            reps = "\n\n4\n8\n8\nBurntout\nBurnout";
          }
          else if (week == 7)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n3\n4\n4\n3\n3";
            reps = "\n\n3\n6\n6\nBurntout\nBurnout";
          }
          else if (week == 8)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n3\n4\n4\n3\n3";
            reps = "\n\n4\n7\n7\nBurntout\nBurnout";
          }
          else if (week == 9)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n4\n4\n4\n3\n3";
            reps = "\n\n4\n8\n8\nBurntout\nBurnout";
          }
          else if (week == 10)
          {
            exercise = "\n\n Barbell Row\n Dumbbell Single Arm Row\n Seated Machine Row\n Close Grip Pull Ups\n Wide Grip Pull Ups";
            sets = "\n\n3\n4\n4\n3\n3";
            reps = "\n\n3\n6\n6\nBurntout\nBurnout";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      case "LEGS":
      {
        if (difficulty == "Beginner")
        {
          if (week == 1)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "3\n20";
          }
          else if (week == 2)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "4\n20";
          }
          else if (week == 3)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "3\n20";
          }
          else if (week == 4)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "4\n20";
          }
          else if (week == 5)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "3\n20";
          }
          else if (week == 6)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "4\n20";
          }
          else if (week == 7)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "3\n20";
          }
          else if (week == 8)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "4\n20";
          }
          else if (week == 9)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "3\n20";
          }
          else if (week == 10)
          {
            exercise = " Smith Machine Squats\n Lunges";
            sets = "3\n2";
            reps = "4\n20";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Intermediate")
        {
          if (week == 1)
          {
            exercise = "\n\n Squat Program\n Leg Press\n Lunges\n *Your focus on this Intermediate program is to improve on squat form/weights. Check out squat programs.";
            sets = "--\n3\n2";
            reps = "--\n8\n20";
          }
          else if (week == 2)
          {
            exercise = " Squat Program\n Leg Press\n Lunges";
            sets = "--\n3\n2";
            reps = "--\n8\n20";
          }
          else if (week == 3)
          {
            exercise = " Squat Program\n Leg Press\n Lunges";
            sets = "--\n3\n2";
            reps = "--\n8\n20";
          }
          else if (week == 4)
          {
            exercise = " Squat Program\n Leg Press\n Lunges";
            sets = "--\n3\n2";
            reps = "--\n8\n20";
          }
          else if (week == 5)
          {
            exercise = " Squat Program\n Leg Press\n Lunges";
            sets = "--\n3\n2";
            reps = "--\n8\n20";
          }
          else if (week == 6)
          {
            exercise = " Squat Program\n Leg Press\n Lunges";
            sets = "--\n3\n3";
            reps = "--\n8\n20";
          }
          else if (week == 7)
          {
            exercise = " Squat Program\n Leg Press\n Lunges";
            sets = "--\n3\n3";
            reps = "--\n8\n20";
          }
          else if (week == 8)
          {
            exercise = " Squat Program\n Leg Press\n Lunges";
            sets = "--\n3\n3";
            reps = "--\n8\n20";
          }
          else if (week == 9)
          {
            exercise = " Squat Program\n Leg Press\n Lunges";
            sets = "--\n3\n3";
            reps = "--\n8\n20";
          }
          else if (week == 10)
          {
            exercise = " Squat Program\n Leg Press\n Lunges";
            sets = "--\n3\n3";
            reps = "--\n8\n20";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises\n *Your focus will be on Deadlift/Squat programs of your chosing. The previous page contains programs.";
            sets = "--\n--\n4\n4";
            reps = "--\n--\n8\n8";
          }
          else if (week == 2)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises";
            sets = "\n\n--\n--\n4\n4";
            reps = "\n\n--\n--\n8\n8";
          }
          else if (week == 3)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises";
            sets = "\n\n--\n--\n4\n4";
            reps = "\n\n--\n--\n8\n8";
          }
          else if (week == 4)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises";
            sets = "\n\n--\n--\n4\n4";
            reps = "\n\n--\n--\n8\n8";
          }
          else if (week == 5)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises";
            sets = "\n\n--\n--\n4\n4";
            reps = "\n\n--\n--\n8\n8";
          }
          else if (week == 6)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises";
            sets = "\n\n--\n--\n4\n4";
            reps = "\n\n--\n--\n8\n8";
          }
          else if (week == 7)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises";
            sets = "\n\n--\n--\n4\n4";
            reps = "\n\n--\n--\n8\n8";
          }
          else if (week == 8)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises";
            sets = "\n\n--\n--\n4\n4";
            reps = "\n\n--\n--\n8\n8";
          }
          else if (week == 9)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises";
            sets = "\n\n--\n--\n4\n4";
            reps = "\n\n--\n--\n8\n8";
          }
          else if (week == 10)
          {
            exercise = "\n\n Deadlift Program\n Squat Program\n Leg Press\n Leg Raises";
            sets = "\n\n--\n--\n4\n4";
            reps = "\n\n--\n--\n8\n8";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      case "BICEPS":
      {
        if (difficulty == "Beginner")
        {
          if (week == 1)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "6\n8\n8";
          }
          else if (week == 2)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "7\n9\n9";
          }
          else if (week == 3)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "8\n10\n10";
          }
          else if (week == 4)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "6\n8\n8";
          }
          else if (week == 5)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "7\n9\n9";
          }
          else if (week == 6)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "8\n10\n10";
          }
          else if (week == 7)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "6\n8\n8";
          }
          else if (week == 8)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "7\n9\n9";
          }
          else if (week == 9)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "8\n10\n10";
          }
          else if (week == 10)
          {
            exercise = " Seated Bicep Curls\n One-Handed Cables\n Two-Handed Cables";
            sets = "4\n4\n4";
            reps = "6\n8\n8";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Intermediate")
        {
          if (week == 1)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n6\n6\n6\n6";
          }
          else if (week == 2)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n7\n7\n7\n7";
          }
          else if (week == 3)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n8\n8\n8\n8";
          }
          else if (week == 4)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n6\n6\n6\n6";
          }
          else if (week == 5)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n7\n7\n7\n7";
          }
          else if (week == 6)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n8\n8\n8\n8";
          }
          else if (week == 7)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n6\n6\n6\n6";
          }
          else if (week == 8)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n7\n7\n7\n7";
          }
          else if (week == 9)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n8\n8\n8\n8";
          }
          else if (week == 10)
          {
            exercise = "\n Seated Bicep Curls\n Seated Hammer Curls\n Barbell Bicep Curls\n One-Handed Cables";
            sets = "\n4\n4\n4\n4";
            reps = "\n6\n6\n6\n6";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n6\n6\n8\n6";
          }
          else if (week == 2)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n7\n7\n9\n7";
          }
          else if (week == 3)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n8\n8\n10\n8";
          }
          else if (week == 4)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n6\n6\n8\n6";
          }
          else if (week == 5)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n7\n7\n9\n7";
          }
          else if (week == 6)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n8\n8\n10\n8";
          }
          else if (week == 7)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n6\n6\n8\n6";
          }
          else if (week == 8)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n7\n7\n9\n7";
          }
          else if (week == 9)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n8\n8\n10\n8";
          }
          else if (week == 10)
          {
            exercise = "\n\n Preacher Curls\n SUPERSET: Hammer Curl\n One-Handed Cable\n Two-Handed Cables\n Barbell Curls\n Seated Curls";
            sets = "\n\n3\n3\n4\n4\n3\n4";
            reps = "\n\n12\n10\n6\n6\n8\n6";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      case "TRICEPS":
      {
        if (difficulty == "Beginner")
        {
          if (week == 1)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n6\n6";
          }
          else if (week == 2)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n7\n7";
          }
          else if (week == 3)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n8\n8";
          }
          else if (week == 4)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n6\n6";
          }
          else if (week == 5)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n7\n7";
          }
          else if (week == 6)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n8\n8";
          }
          else if (week == 7)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n6\n6";
          }
          else if (week == 8)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n7\n7";
          }
          else if (week == 9)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n8\n8";
          }
          else if (week == 10)
          {
            exercise = " Dumbbell Extension\n One-Handed Cables";
            sets = "\n3\n4";
            reps = "\n6\n6";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Intermediate")
        {
          if (week == 1)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n3\n4\n4\n3";
            reps = "\n6\n6\n6\nBurnout";
          }
          else if (week == 2)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n4\n4\n4\n3";
            reps = "\n8\n8\n6\nBurnout";
          }
          else if (week == 3)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n5\n5\n4\n3";
            reps = "\n7\n7\n6\nBurnout";
          }
          else if (week == 4)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n3\n4\n4\n3";
            reps = "\n6\n6\n6\nBurnout";
          }
          else if (week == 5)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n4\n4\n4\n3";
            reps = "\n8\n8\n6\nBurnout";
          }
          else if (week == 6)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n5\n5\n4\n3";
            reps = "\n7\n7\n6\nBurnout";
          }
          else if (week == 7)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n3\n4\n4\n3";
            reps = "\n6\n6\n6\nBurnout";
          }
          else if (week == 8)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n4\n4\n4\n3";
            reps = "\n8\n8\n6\nBurnout";
          }
          else if (week == 9)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n5\n5\n4\n3";
            reps = "\n7\n7\n6\nBurnout";
          }
          else if (week == 10)
          {
            exercise = "\n Dumbbell Extension\n One-Handed Cables\n Two-Handed Cables\n Push Ups";
            sets = "\n3\n4\n4\n3";
            reps = "\n6\n6\n6\nBurnout";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n3\n4\n4\n4\n5";
            reps = "\n\n3\n6\n6\n6\nBurnout";
          }
          else if (week == 2)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n3\n4\n4\n4\n5";
            reps = "\n\n4\n7\n7\n7\nBurnout";
          }
          else if (week == 3)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n4\n4\n4\n4\n5";
            reps = "\n\n4\n8\n8\n8\nBurnout";
          }
          else if (week == 4)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n3\n4\n4\n4\n5";
            reps = "\n\n3\n6\n6\n6\nBurnout";
          }
          else if (week == 5)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n3\n4\n4\n4\n5";
            reps = "\n\n4\n7\n7\n7\nBurnout";
          }
          else if (week == 6)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n4\n4\n4\n4\n5";
            reps = "\n\n4\n8\n8\n8\nBurnout";
          }
          else if (week == 7)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n3\n4\n4\n4\n5";
            reps = "\n\n3\n6\n6\n6\nBurnout";
          }
          else if (week == 8)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n3\n4\n4\n4\n5";
            reps = "\n\n4\n7\n7\n7\nBurnout";
          }
          else if (week == 9)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n4\n4\n4\n4\n5";
            reps = "\n\n4\n8\n8\n8\nBurnout";
          }
          else if (week == 10)
          {
            exercise = "\n\n Close-Grip Bench Press\n Cables (Handle)\n Cables (Rope)\n Cables (Curved Bar)\n Push Ups";
            sets = "\n\n3\n4\n4\n4\n5";
            reps = "\n\n3\n6\n6\n6\nBurnout";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      case "ABS":
      {
        if (difficulty == "Beginner")
        {
          if (week == 1)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else if (week == 2)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else if (week == 3)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else if (week == 4)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else if (week == 5)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else if (week == 6)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else if (week == 7)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else if (week == 8)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else if (week == 9)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else if (week == 10)
          {
            exercise = " Situps\n Machine Situps";
            sets = "\n3\n4";
            reps = "\n15\n15";
          }
          else
          {
              exercise = null;
              sets = null;
              reps = null;
          }
        }
        else if (difficulty == "Intermediate")
        {
          if (week == 1)
          {
            exercise = "\n\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n4\n3";
            reps = "\n\n15\n60 sec.\n15\n15";
          }
          else if (week == 2)
          {
            exercise = "\n\n\n Side-to-Sides\n Machine Situps\n Leg Raises\n Negative Incline Situps\n *Negative inc. situps are usually done with medicine ball.";
            sets = "\n\n3\n4\n3\n3";
            reps = "\n\n60 sec.\n15\n15\n15";
          }
          else if (week == 3)
          {
            exercise = "\n\n Machine Situps\n Leg Raises\n Negative Incline Situps\n Flutter Kicks";
            sets = "\n\n4\n3\n3\n3";
            reps = "\n\n15\n15\n15\n60 sec.";
          }
          else if (week == 4)
          {
            exercise = "\n\n Leg Raises\n Negative Incline Situps\n Flutter Kicks\n Situps";
            sets = "\n\n3\n3\n3\n3";
            reps = "\n\n15\n15\n60 sec.\n15";
          }
          else if (week == 5)
          {
            exercise = "\n\n Negative Incline Situps\n Flutter Kicks\n Situps\n Side-to-Sides";
            sets = "\n\n3\n3\n3\n3";
            reps = "\n\n15\n60 sec.\n15\n60 sec.";
          }
          else if (week == 6)
          {
            exercise = "\n\n Flutter Kicks\n Situps\n Side-to-Sides\n Machine Situps";
            sets = "\n\n3\n3\n3\n4";
            reps = "\n\n60 sec.\n15\n60 sec.\n15";
          }
          else if (week == 7)
          {
            exercise = "\n\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n4\n3";
            reps = "\n\n15\n60 sec.\n15\n15";
          }
          else if (week == 8)
          {
            exercise = "\n\n Side-to-Sides\n Machine Situps\n Leg Raises\n Negative Incline Situps";
            sets = "\n\n3\n4\n3\n3";
            reps = "\n\n60 sec.\n15\n15\n15";
          }
          else if (week == 9)
          {
            exercise = "\n\n Machine Situps\n Leg Raises\n Negative Incline Situps\n Flutter Kicks";
            sets = "\n\n4\n3\n3\n3";
            reps = "\n\n15\n15\n15\n60 sec.";
          }
          else if (week == 10)
          {
            exercise = "\n\n Leg Raises\n Negative Incline Situps\n Flutter Kicks\n Situps";
            sets = "\n\n3\n3\n3\n3";
            reps = "\n\n15\n15\n60 sec.\n15";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          15\n          60 sec.\n          15\n          60 sec.\n          15\n          15";
          }
          else if (week == 2)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          15\n          60 sec.\n          15\n          60 sec.\n          15\n          15";
          }
          else if (week == 3)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          15\n          60 sec.\n          15\n          60 sec.\n          15\n          15";
          }
          else if (week == 4)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          15\n          60 sec.\n          15\n          60 sec.\n          15\n          15";
          }
          else if (week == 5)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          15\n          60 sec.\n          15\n          60 sec.\n          15\n          15";
          }
          else if (week == 6)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          20\n          80 sec.\n          20\n          80 sec.\n          20\n          20";
          }
          else if (week == 7)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          20\n          80 sec.\n          20\n          80 sec.\n          20\n          20";
          }
          else if (week == 8)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          20\n          80 sec.\n          20\n          80 sec.\n          20\n          20";
          }
          else if (week == 9)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          20\n          80 sec.\n          20\n          80 sec.\n          20\n          20";
          }
          else if (week == 10)
          {
            exercise = "\n\n Negative Side-to-Sides\n Planks\n Situps\n Side-to-Sides\n Machine Situps\n Leg Raises";
            sets = "\n\n3\n3\n3\n3\n4\n3";
            reps = "\n\n          20\n          80 sec.\n          20\n          80 sec.\n          20\n          20";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      case "SQUAT":
      {
      
        if (difficulty == "Beginner")
        {
          if (week == 1)
          {
            temp = maxLift * .6;
            temp2 = maxLift * .65;
            temp3 = maxLift * .7;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()} ";
            sets = "\n 2\n 1\n 1";
            reps = "\n 5\n 3\n 2";
          }
          else if (week == 2)
          {
            temp = maxLift * .6;
            temp2 = maxLift * .65;
            temp3 = maxLift * .7;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()} ";
            sets = "\n 1\n 2\n 1";
            reps = "\n 4\n 4\n 2";
          }
          else if (week == 3)
          {
            temp = maxLift * .6;
            temp2 = maxLift * .65;
            temp3 = maxLift * .7;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()} ";
            sets = "\n 1\n 1\n 1";
            reps = "\n 4\n 4\n 3";
          }
          else if (week == 4)
          {
            temp = maxLift * .6;
            temp2 = maxLift * .65;
            temp3 = maxLift * .7;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()} ";
            sets = "\n 1\n 1\n 2";
            reps = "\n 4\n 4\n 4";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
            break;
          }
        if (difficulty == "Intermediate")
        {
          if (week == 1)
          {
            temp = maxLift * .85;
            exercise = "\n ${temp.toString()} lbs} ";
            sets = "\n 10";
            reps = "\n 1";
          }
          else if (week == 2)
          {
            temp = maxLift * .85;
            exercise = "\n ${temp.toString()} lbs} ";
            sets = "\n 4";
            reps = "\n 2";
          }
          else if (week == 3)
          {
            temp = maxLift * .85;
            exercise = "\n ${temp.toString()} lbs} ";
            sets = "\n 4";
            reps = "\n 3";
          }
          else if (week == 4)
          {
            temp = maxLift * .85;
            exercise = "\n ${temp.toString()} lbs} ";
            sets = "\n 2";
            reps = "\n 4";
          }
          else if (week == 5)
          {
            temp = maxLift * .85;
            exercise = "\n ${temp.toString()} lbs} ";
            sets = "\n 1";
            reps = "\n AMRAP";
          }
          else if (week == 6)
          {
            temp = maxLift * .85;
            exercise = "\n ${temp.toString()} lbs} ";
            sets = "\n 3";
            reps = "\n 4";
          }    
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
            break;
          }
        if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            temp = maxLift * .8;
            temp2 = maxLift * .86;
            temp3 = maxLift * .925;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()} lbs";
            sets = "\n 1\n 1\n 1";
            reps = "\n 2\n 2\n 2";
          }
          else if (week == 2)
          {
            temp = maxLift * .8;
            temp2 = maxLift * .875;
            temp3 = maxLift * .95;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()} lbs";
            sets = "\n 1\n 1\n 1";
            reps = "\n 4\n 3\n 2";
          }
          else if (week == 3)
          {
            temp = maxLift * .8;
            temp2 = maxLift * .86;
            temp3 = maxLift * .92;
            temp4 = maxLift * .975;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()}\n ${temp4.toString()} lbs";
            sets = "\n 1\n 1\n 1\n 1";
            reps = "\n 2\n 2\n 2\n 2";
          }
          else if (week == 4)
          {
            temp = maxLift * .8;
            temp2 = maxLift * .875;
            temp3 = maxLift * .95;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()} lbs";
            sets = "\n 1\n 1\n 1";
            reps = "\n 5\n 4\n 3";
          }
          else if (week == 5)
          {
            temp = maxLift * .8;
            temp2 = maxLift * .86;
            temp3 = maxLift * .92;
            temp4 = maxLift * .975;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()}\n ${temp4.toString()} lbs";
            sets = "\n 1\n 1\n 1\n 1";
            reps = "\n 2\n 2\n 2\n 2";
          }
          else if (week == 6)
          {
            temp = maxLift * .8;
            temp2 = maxLift * .86;
            temp3 = maxLift * .925;
            exercise = "\n ${temp.toString()} lbs\n ${temp2.toString()} lbs\n ${temp3.toString()} lbs";
            sets = "\n 1\n 1\n 1";
            reps = "\n 2\n 1\n 4+";
          } 
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      case "DEADLIFT":
      {
        if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            temp = maxLift * .75;
            temp2 = maxLift * .60;
            exercise = "\n The advanced program features the Ed Coan Deadlift\n Program. Round weight to the nearest 5 lbs. Rest ~90 sec. \n between each speed set.\n Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = "\n\n\n\n 1\n 8";
            reps = "\n\n\n\n 2\n 3";
          }
          else if (week == 2)
          {
            temp = maxLift * .80;
            temp2 = maxLift * .65;
            exercise = " Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = " 1\n 8";
            reps = " 2\n 3";
          }
          else if (week == 3)
          {
            temp = maxLift * .85;
            temp2 = maxLift * .70;
            exercise = " Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = " 1\n 6";
            reps = " 2\n 3";
          }
          else if (week == 4)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .75;
            exercise = " Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = " 1\n 5";
            reps = " 2\n 3";
          }
          else if (week == 5)
          {
            temp = maxLift * .80;
            temp2 = maxLift * .65;
            exercise = " Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = " 3\n 3";
            reps = " 3\n 3";
          }
          else if (week == 6)
          {
            temp = maxLift * .85;
            temp2 = maxLift * .70;
            exercise = " Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = " 1\n 3";
            reps = " 2\n 3";
          }
          else if (week == 7)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .75;
            exercise = " Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = " 1\n 3";
            reps = " 2\n 3";
          }
          else if (week == 8)
          {
            temp = maxLift * .95;
            temp2 = maxLift * .70;
            exercise = " Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = " 1\n 3";
            reps = " 2\n 3";
          }
          else if (week == 9)
          {
            temp = maxLift * .975;
            temp2 = maxLift * .70;
            exercise = " Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = " 1\n 2";
            reps = " 1\n 3";
          }
          else if (week == 10)
          {
            temp = maxLift * 1.0;
            temp2 = maxLift * .60;
            exercise = " MAX DAY\n\n Heavy Set @ ${temp.toString()} lbs\n Speed Sets @ ${temp2.toString()} lbs";
            sets = "\n\n 1\n 2";
            reps = "\n\n 1\n 3";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      case "BENCH":
      {
        if (difficulty == "Beginner")
        {
          if (week == 1)
          {
            temp = maxLift * .70;
            exercise = " Flat Bench @ ${temp.toString()}";
            sets = "3";
            reps = "15";
          }
          else if (week == 2)
          {
            temp = maxLift * .75;
            exercise = " Flat Bench @ ${temp.toString()}";
            sets = "3";
            reps = "12";
          }
          else if (week == 3)
          {
            temp = maxLift * .85;
            exercise = " Flat Bench @ ${temp.toString()}";
            sets = "3";
            reps = "1";
          }
          else if (week == 4)
          {
            temp = maxLift * .50;
            exercise = " Flat Bench @ ${temp.toString()}";
            sets = "3";
            reps = "10";
          }
          else if (week == 5)
          {
            temp = maxLift * .80;
            exercise = " Flat Bench @ ${temp.toString()}";
            sets = "3";
            reps = "5";
          }
          else if (week == 6)
          {
            temp = maxLift * .85;
            exercise = " Flat Bench @ ${temp.toString()}";
            sets = "3";
            reps = "3";
          }
          else if (week == 7)
          {
            temp = maxLift * .95;
            exercise = " Flat Bench @ ${temp.toString()}";
            sets = "3";
            reps = "1";
          }
          else if (week == 8)
          {
            temp = maxLift * .75;
            exercise = " Max Day - Find new max";
            sets = "1";
            reps = "1";
          }
          else if (week == 9)
          {
            temp = maxLift * .75;
            exercise = " Program complete";
            sets = "-";
            reps = "-";
          }
          else if (week == 10)
          {
            temp = maxLift * .75;
            exercise = " Program Complete";
            sets = "-";
            reps = "-";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Intermediate")
        {
          if (week == 1)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .75;
            temp3 = maxLift * .60;
            exercise = "\n This program features Ken Lain's benching program. It's a\n 10 week program that consists of benching twice a week.\n Day 1 @ ${temp.toString()} lbs\n Day 1 @ ${temp2.toString()} lbs\n Day 2 @ ${temp3.toString()} lbs";
            sets = "\n\n\n 1\n 2\n 3";
            reps = "\n\n\n 1\n 10\n 3";
          }
          else if (week == 2)
          {
            temp = maxLift * .92;
            temp2 = maxLift * .775;
            temp3 = maxLift * .60;
            exercise = "\n Day 1 @ ${temp.toString()} lbs\n Day 1 @ ${temp2.toString()} lbs\n Day 2 @ ${temp3.toString()} lbs";
            sets = "\n 1\n 2\n 3";
            reps = "\n 1\n 9\n 3";
          }
          else if (week == 3)
          {
            temp = maxLift * .94;
            temp2 = maxLift * .80;
            temp3 = maxLift * .60;
            exercise = "\n Day 1 @ ${temp.toString()} lbs\n Day 1 @ ${temp2.toString()} lbs\n Day 2 @ ${temp3.toString()} lbs";
            sets = "\n 1\n 2\n 3";
            reps = "\n 1\n 8\n 3";
          }
          else if (week == 4)
          {
            temp = maxLift * .96;
            temp2 = maxLift * .825;
            temp3 = maxLift * .60;
            exercise = "\n Day 1 @ ${temp.toString()} lbs\n Day 1 @ ${temp2.toString()} lbs\n Day 2 @ ${temp3.toString()} lbs";
            sets = "\n 1\n 2\n 3";
            reps = "\n 1\n 7\n 3";
          }
          else if (week == 5)
          {
            temp = maxLift * .98;
            temp2 = maxLift * .85;
            temp3 = maxLift * .60;
            exercise = "\n Day 1 @ ${temp.toString()} lbs\n Day 1 @ ${temp2.toString()} lbs\n Day 2 @ ${temp3.toString()} lbs";
            sets = "\n 1\n 2\n 3";
            reps = "\n 1\n 6\n 3";
          }
          else if (week == 6)
          {
            temp = maxLift * 1.0;
            temp2 = maxLift * .875;
            temp3 = maxLift * .60;
            exercise = "\n Day 1 @ ${temp.toString()} lbs\n Day 1 @ ${temp2.toString()} lbs\n Day 2 @ ${temp3.toString()} lbs";
            sets = "\n 1\n 2\n 3";
            reps = "\n 1\n 5\n 3";
          }
          else if (week == 7)
          {
            temp = maxLift * 1.02;
            temp2 = maxLift * .90;
            temp3 = maxLift * .60;
            exercise = "\n Day 1 @ ${temp.toString()} lbs\n Day 1 @ ${temp2.toString()} lbs\n Day 2 @ ${temp3.toString()} lbs";
            sets = "\n 1\n 2\n 3";
            reps = "\n 1\n 4\n 3";
          }
          else if (week == 8)
          {
            temp = maxLift * 1.04;
            temp2 = maxLift * .925;
            temp3 = maxLift * .60;
            exercise = "\n Day 1 @ ${temp.toString()} lbs\n Day 1 @ ${temp2.toString()} lbs\n Day 2 @ ${temp3.toString()} lbs";
            sets = "\n 1\n 2\n 3";
            reps = "\n 1\n 3\n 3";
          }
          else if (week == 9)
          {
            temp = maxLift * .95;
            temp2 = maxLift * .775;
            temp3 = maxLift * .60;
            exercise = " Day 1 @ ${temp.toString()} lbs\n Day 2";
            sets = " 1 \n Rest";
            reps = " 2";
          }
          else if (week == 10)
          {
            temp = maxLift * 1.0;
            temp2 = maxLift * 1.04;
            temp3 = maxLift * 1.08;
            exercise = "\n Day 1 @ ${temp.toString()} lbs\n Day 1 @ ${temp2.toString()} lbs\n Day 1 @ ${temp3.toString()} lbs";
            sets = "\n 1\n 1\n 1";
            reps = "\n 1\n 1\n 1";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        else if (difficulty == "Advanced")
        {
          if (week == 1)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\n This features the Texas Method - three days a week with a\n goal of a new 5 rep max at the end of the week. \n Day 1 Volume @ ${temp.toString()} lbs\n Day 2 Recovery @ ${temp2.toString()} lbs\n Day 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n\n\n 5\n 3\n 1";
            reps = "\n\n\n 5\n 5\n 5";
          }
          else if (week == 2)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\nDay 1 Volume @ ${temp.toString()} lbs\nDay 2 Recovery @ ${temp2.toString()} lbs\nDay 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n 5\n 3\n 1";
            reps = "\n 5\n 5\n 5";
          }
          else if (week == 3)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\nDay 1 Volume @ ${temp.toString()} lbs\nDay 2 Recovery @ ${temp2.toString()} lbs\nDay 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n 5\n 3\n 1";
            reps = "\n 5\n 5\n 5";
          }
          else if (week == 4)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\nDay 1 Volume @ ${temp.toString()} lbs\nDay 2 Recovery @ ${temp2.toString()} lbs\nDay 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n 5\n 3\n 1";
            reps = "\n 5\n 5\n 5";
          }
          else if (week == 5)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\nDay 1 Volume @ ${temp.toString()} lbs\nDay 2 Recovery @ ${temp2.toString()} lbs\nDay 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n 5\n 3\n 1";
            reps = "\n 5\n 5\n 5";
          }
          else if (week == 6)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\nDay 1 Volume @ ${temp.toString()} lbs\nDay 2 Recovery @ ${temp2.toString()} lbs\nDay 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n 5\n 3\n 1";
            reps = "\n 5\n 5\n 5";
          }
          else if (week == 7)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\nDay 1 Volume @ ${temp.toString()} lbs\nDay 2 Recovery @ ${temp2.toString()} lbs\nDay 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n 5\n 3\n 1";
            reps = "\n 5\n 5\n 5";
          }
          else if (week == 8)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\nDay 1 Volume @ ${temp.toString()} lbs\nDay 2 Recovery @ ${temp2.toString()} lbs\nDay 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n 5\n 3\n 1";
            reps = "\n 5\n 5\n 5";
          }
          else if (week == 9)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\nDay 1 Volume @ ${temp.toString()} lbs\nDay 2 Recovery @ ${temp2.toString()} lbs\nDay 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n 5\n 3\n 1";
            reps = "\n 5\n 5\n 5";
          }
          else if (week == 10)
          {
            temp = maxLift * .90;
            temp2 = maxLift * .90;
            temp3 = maxLift * 1.02;
            exercise = "\nDay 1 Volume @ ${temp.toString()} lbs\nDay 2 Recovery @ ${temp2.toString()} lbs\nDay 3 New 5RM @ ${temp3.toString()} lbs";
            sets = "\n 5\n 3\n 1";
            reps = "\n 5\n 5\n 5";
          }
          else
          {
            exercise = null;
            sets = null;
            reps = null;
          }
        }
        break;
      }
      default:
      {
        break;
      }
    break;
    }
  }

  void getMax()
  {
    setState(() {
       maxLift = max;
    });
  }

  @override
  Widget build(BuildContext context){
    defineWorkout(muscle, weekNum);
    return Card(
      margin: EdgeInsets.all(5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: 375,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.greenAccent[200],
          border: Border.all(
          color: Colors.greenAccent[200],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.95, -0.9),
            child: Text ("WEEK $weekNum",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.95, -0.65),
            child: Text ("Excercises",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-.95, 0),
            child: Text("$exercise")
          ),
          if ((muscle == "SQUAT" || muscle == "BENCH"  || muscle == "DEADLIFT") && weekNum == 1)
          Align(
            alignment: Alignment(0, -0.95),
            child: Text ("Desired Max: $maxLift lbs",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if ((muscle == "SQUAT" || muscle == "BENCH"  || muscle == "DEADLIFT") && weekNum == 1)
          Align(
            alignment: Alignment(0, 1),
            child: Container(
              height: 20,
              child: RaisedButton(
                onPressed: (){
                  return showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Set Desired Max"),
                        content: TextField(
                          controller: myController,
                          decoration: InputDecoration(hintText: "Input Goal"),
                        ),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("DONE"),
                              onPressed: (){
                              max = int.parse(myController.text);
                              getMax();
                              print(max);
                              Navigator.of(context).pop();
                              },
                            ),
                          new FlatButton(
                            child: new Text("CANCEL"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    }
                );
              },
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              child: Text("Set Desired Max"),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.65),
            child: Text ("Sets",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0),
            child: Text("$sets"),
          ),
          Align(
            alignment: Alignment(0.9, -0.65),
            child: Text ("Repetitions",
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.9, 0),
            child: Text("$reps"),
          ),
        ],
        ),
      ),
    );
  }

}