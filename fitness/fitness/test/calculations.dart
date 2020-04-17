import 'package:MyGymPro/mainpage.dart';
import 'package:flutter_test/flutter_test.dart';

void main()
{
  final pedometer = MainPageState();
  group("Calories", () {

    test("0 Calories should be burned", () {
      pedometer.getCaloriesBurned(0);
      expect(pedometer.stepsToCaloriesTest, "0.00");
    });

    test("40000 Calories should be burned", () {
      pedometer.getCaloriesBurned(1000000);
      expect(pedometer.stepsToCaloriesTest, "40000.00");
    });

    test("Negative values error", () {
      pedometer.getCaloriesBurned(-100);
      expect(pedometer.stepsToCaloriesTest, "Error: negative value");
    });
  });

  group("Distance traveled", () {
    
    test("0 miles traveled", () {
      pedometer.getDistanceRun(0);
      expect(pedometer.distanceTest, "0.00");
    });

    test("40000 Calories should be burned", () {
      pedometer.getDistanceRun(1000000);
      expect(pedometer.distanceTest, "473.48");
    });

    test("Negative values error", () {
      pedometer.getDistanceRun(-100);
      expect(pedometer.distanceTest, "Error: negative value");
    });
  });

  group("Circular Percent", () {
    
    test("0 percent", () {
      expect(pedometer.getCircularPercent(0, "100"), 0.0);
    });

    test("50 percent", () {
      expect(pedometer.getCircularPercent(50, "25"), 0.50);
    });

    test("100 percent test 1", () {
      expect(pedometer.getCircularPercent(50,"50"), 1.00);
    });

    test("100 percent test 2", () {
      expect(pedometer.getCircularPercent(50,"100"), 1.00);
    });

    test("Null and unknown", () {
      expect(pedometer.getCircularPercent(null,"Unknown"), 0.0);
    });

    test("Null and known", () {
      expect(pedometer.getCircularPercent(null, "50"), 0.0);
    });

    test("Non-null and unknown", () {
      expect(pedometer.getCircularPercent(50, "Unknown"), 0.0);
    });

  });


  

}
