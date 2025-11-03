

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Appendix])
  counter(heading).update(0)
  body
}
#let regular(body) = {
  set heading(supplement: [Regular])
  body
}

#set heading(numbering: "1.")

#set align(center)
*Assignment 1:* 

*Modeling the motion of a falling object with drag*

SCIE 001 Physics

Noah Virjee

#let today = datetime.today()

#today.display("[month repr:long]") #today.day(), #today.year()// or another custom format


#figure(
  image("allThree.svg"),
  caption: [
    Cover photo of the combined results from fitting the collected distance measurements with Euler method-based drag simulations. Fits with the lowest and highest reasonable drag coefficients are in cyan and green respectively.   
  ],
) <allThree>

#set align(left)

#outline(target: heading.where(supplement: [Regular]))

#outline(target: heading.where(supplement: [Appendix]), title: [Appendix])

#pagebreak()

#show: regular

= Introduction
I measured the distance of an empty tissue box from the ground over time when dropped from various heights with an ultrasonic sensor and fit an Euler method-based simulation to this data to determine its coefficient of drag. The tissue box weighed  $(0.03656 plus.minus 2.887 times 10^(-6))$ kg with a frontal area of $(0.02407 plus.minus 2.491 times 10^(-4)) " m"^2$. 

#grid(
  columns: 2,
  gutter: 5pt,
  
  [#figure(
  image("IMG_3701.jpeg", width: 70%),
  caption: [
    For the experimental setup the ultrasonic sensor was placed on the ground facing up and the box was dropped on top of it. Note: a different empty tissue box with a similar pattern was used with another empty box to prevent the ultrasonic sensor from taking the full force of the impact. 
  ],
) <ExperimentalSetup>],

[#figure(
  image("IMG_3709.jpeg", width: 70%),
  caption: [
    An image of the tissue box that was dropped onto the sensor on a scale with 0.01g precision. Note: it was dropped plastic side up. 
  ],
) <ExperimentalSetup>]
)

= Results
I selected distance and time data from three drops, then manually fit a one-dimensional forward Euler simulation to each dataset. 

For the initial values of the simulation, I set $y_0 = d_0,   v_y = 0$ for all runs, then changed the time offset individually to match the start of the simulation with the instant of the drop. 

I used an acceleration value of 

$ accent(a, arrow) = -g + (-1/2 rho A C_D v^2accent(v, hat))/m $


I.e: 

```python ay = -g + ( ( - (1/2) * D * density_of_air * frontal_area * np.sqrt(vy**2) * vy ) / mass )   ```

Note the simplification of $v^2accent(v, hat)$: 
$ 
v^2accent(v, hat) = v^2(accent(v, arrow) / v) = v accent(v, arrow) = abs(accent(v, arrow))accent(v, arrow) = (sqrt(v_y^2))v_y = "abs"(v_y)v_y
$

For the constants I used
$g = 9.81 " m/s"^2$,
$rho = 1.204 " kg/m"^3$ for the air density at 20ºC at sea level @EngineeringToolbox_air_density_2025 .

To get the distance from the pulse-time measurement I used: 
$ 
d = (("pulsetime in" mu s) / 2) ((1 s)/ (10^6 mu s) ) (V)
$
Where $V = 343.21 "m/s" $ the speed of sound at sea level @EngineersEdge_speed_of_sound_2025.

To calculate uncertainty, I used: 
$ sigma = (95% "confidence interval")/4 = abs("greatest possible drag coefficient" - "least possible drag coefficient") / 4 $

#figure(table(
  columns: 4,
  table.header[*Trial*][*Number of Data Points Analyzed*][*Estimated Drag Coefficient* $C_D$][*Relative Uncertainty*],
  [1], [$ 33 $], [$ 1.81 plus.minus 0.295 $], [$ 0.163 $], 
  [2], [$ 25 $], [$ 1.77 plus.minus 0.275 $], [$ 0.155 $], 
  [3], [$ 23 $], [$ 1.84 plus.minus 0.312 $], [$ 0.170 $], 
),
caption: [
    The number of points analyzed, estimated drag, and relative uncertainty for each trial. 
  ]
) <dataTable>

#figure(
  image("EulerFit1.svg", width:80%),
  caption: [
    The Euler simulation fit (red) overlaid on to the calculated distance from the ultrasonic sensor (blue) for the first trial. A delay of 10 ms was used between measurements. For more info on my data collection method see @app1. 
  ]
) <EulerFit1>

#figure(
  image("EulerFit2.svg", width:80%),
  caption: [
    The Euler simulation fit (red) overlaid on to the calculated distance from the ultrasonic sensor (blue) for the second trial. A delay of 20 ms was used between measurements.  
  ]
) <EulerFit2>
#figure(
  image("EulerFit3.svg", width:80%),
  caption: [
    The Euler simulation fit (red) overlaid on to the calculated distance from the ultrasonic sensor (blue) for the second trial. A delay of 20 ms was used between measurements. As one previous Science One student put it, my Euler simulation fit my data "suspiciously well".
  ]
) <EulerFit3>


= Discussion
== Analysis
@EulerFit1, @EulerFit2, and @EulerFit3 show that the height of the box over time followed a parabolic curve that became more linear towards the end (at around 0.45s). This is indicative of an object under constant acceleration and inertial drag. 

The height is described by: 

$
  (d^2 accent(y, arrow)) / (d^2 t) = accent(a, arrow) = -g\ 
  therefore accent(y, arrow) = accent(y_0, arrow) + accent(v_0, arrow) t + 1/2accent(a, arrow)t^2 = accent(y_0, arrow) - 1/2g t^2 wide "Quadratic!"
$
However, there is also drag, causing the object to accelerate less at high downward speeds and eventually hit "terminal velocity". This caused the curve to become linear towards the end: 
$
"At terminal velocity" t approx 0.45s :\
accent( F_d , arrow) = - accent(F_g, arrow) \ 
accent(F_("net"), arrow) = accent(F_g, arrow) + accent(F_d, arrow) = 0 = m accent(a, arrow) \
therefore accent(a, arrow) = 0 \
therefore accent(y, arrow) = accent(y_(0.45s), arrow) + accent(v_(0.45s), arrow) t wide "Linear!"
$

== Estimated Drag Coefficients Comparison
My drag coefficients $C_d$ agree with each other. As seen in @tPrimeValues the t-prime values of all pairs of trials are below 0.2, indicating that there is no evidence these quantities are different. 

For the T-prime equation I used: 
$ "t'" = abs(C_(D A) - C_(D B)) / sqrt((delta C_(D A))^2 + (delta C_(D B)) ^2) $


#figure(
  table(
    columns: 2,
    table.header[*Trial Pair*][*t-prime Score of their Estimated Drag Coefficients*],
    [1 and 2], [$ 0.09918 $],
    [1 and 3], [$ 0.06981 $], 
    [2 and 3], [$ 0.16820 $],
  ),
  caption: [
    The t-prime scores for each pair of trials. 
  ]
) <tPrimeValues>

== Limitations <limitations>

I used a speed of sound of 343.21 m/s @EngineersEdge_speed_of_sound_2025. Using a faster speed of sound would decrease our observed $C_D$ as it would appear the object fell a greater distance in the same amount of time, indicating a lower resistive force. In the future, I would calibrate the sensor to measured distances. For more information see @app2. 

I also experienced difficulties in fitting the Euler model perfectly to the data. In the future I would use a computational fitting routine. 


#show: appendix

= Ultrasonic Measurement and Code Snippets<app1>

Note: I included this appendix just for fun because I found it interesting. You do not have to read it for marking purposes.  

I noticed that many of my colleges were having difficulty obtaining enough data points from the ultrasonic sensor while the object was in free fall to fit the Euler model. To avoid this outcome, I wrote some code to take the measurements faster instead of using the pre-written jupyter notebook. 

This code runs on the Arduino. It repeatedly triggers the ultrasonic sensor, sends the time measurement and the current time in microseconds over the serial bus, and waits 20 ms. 

```c
const int trigPin = 9;
const int echoPin = 10;

float duration;

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(115200);
}

void loop() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  Serial.print("5000,0,");
  Serial.print(micros());
  Serial.print(",");
  Serial.println(duration);

  delay(20);
}
```
Note: the  ```c Serial.print("5000,0,");``` was included to consistently locate the pulse time data on the Arduino IDE's serial viewer. 

Then on my laptop, I used this code to read the data from python. 

```python 
import serial
import time

ser = serial.Serial('/dev/cu.usbmodem14301', 115200, timeout=1)

computer_time = []
arduino_time = []
pulse_time = []

print("Reading")
while True:
    if ser.in_waiting > 0: # Check if there's data in the receive buffer
        line = ser.readline().decode('utf-8').rstrip().split(",")
        a, b, current_arduino_time, current_pulse_time = line
        assert a == "5000"
        assert b == "0"

        computer_time.append(time.time_ns() / 1000)
        arduino_time.append(float(current_arduino_time))
        pulse_time.append(float(current_pulse_time))

```





= Speed of Sound Distance Calibration<app2>

Note: I included this appendix just for fun because I found it interesting. You do not have to read it for marking purposes.  

As shown in @speedOfSoundCalibration calibration of the ultrasonic sensor yielded a speed of sound of 361.14 m/s - much higher than expected for the conditions. To avoid letting this calibration error affect my results, I used 343.21 m/s for the speed of sound at sea level at 20º C @EngineersEdge_speed_of_sound_2025. 

#figure(
  image("Speed of Sound Calibration.svg"), caption: [
    Calibration of the speed of sound from taking successive pulse-time measurements at 0.1 m intervals. 
  ]
) <speedOfSoundCalibration>


After comparing results with Johnathan, I realized that this was most likely from a mis-calibrated timing clock on the ultrasonic sensor module and not my calibration method. I came to this conclusion because of the high $R^2$ value of the fit - any other error in calibration or in measurement would have caused a non-linearity in the data. But since the linear fit was so perfect, it was probably just a clock that was a few microseconds slow. 

And this makes sense, the Arduino's clock signal is synced with my laptop which itself is synced with the internet, but the ultrasonic sensor is never calibrated. 

This would indicate that my speed was composed of both the true speed of sound, and a coefficient representing the error in timing - and that this larger coefficient would have caused the distance measurements to become more accurate (i.e larger). As discussed in #ref(<limitations>, supplement: []), this would lead to a smaller coefficient of drag. 

#bibliography("works.bib")
