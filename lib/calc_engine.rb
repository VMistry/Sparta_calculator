class CalcEngine

  def run_calculator
    #Ask the user what they want to select
    print "What would you like to use(type the acronym): Basic calculator(B), Basic Long calculator(BL), Advanced calculator(A), BMI calculator(BMI) or Trip calculator(T)"
    #Take in user input and find option they are interested in
    answer = gets.chomp.downcase
    calc_options(answer)
  end

  #chooses a function to use
  def calc_options(answer)
    #If the user enters b, the basic calculator function will be activated.
    if(answer == "b" || answer == "basic calculator")
      basic

    #If the user enters bl, the basic long calculator function will be activated.
    elsif(answer == "bl" || answer == "basic Long calculator")
      basic_long

    #If the user enters a, the advanced calculator function will be activated.
    elsif(answer == "a" || answer == "advanced calculator")
      advanced

    #If the user enter bmi, the BMI calculator function will be activated.
    elsif(answer == "bmi" || answer == "bmi calculator")
      bmi

    #If the user enters t, the travel calculator function will be activated.
    elsif(answer == "t" || answer == "trip calculator")
      # Ask the user for distance, fuel_consumption, cost and speed.
      # Take in user input for each question.
      print "Type in How far you travelled in kilometers"
      distance = gets.chomp.to_f
      print "Type in your fuel consumption"
      fuel_consumption = gets.chomp.to_f
      print "Type in how much per litres fuel costs"
      cost = gets.chomp.to_f
      print "How fast were you travelling (Miles per hour)?"
      speed = gets.chomp.to_i
      #Using inputs, calculate travel cost and times.
      trip_calculator(distance, fuel_consumption, cost, speed)

    #If the user enters something not on the list, an error message will popup.
    else
      #This is if it does not recognise inputs
      print "error."
      #rerun function
      run_calculator
    end
  end

  #This adds numbers
  def add(num1, num2)
    return num1 + num2
  end
  #This minus numbers
  def minus(num1, num2)
    return num1 - num2
  end
  #This divides numbers
  def divide(num1, num2)
    return num1 / num2
  end
  #This multiplys numbers
  def multiple(num1, num2)
    return num1 * num2
  end

  #Seleting operators calculator
  def operation_selector(operation, num1, num2)
    #Find out if the operation is a +, -, * or /.
    if(operation == "+")
      return add(num1, num2)
    elsif(operation == "-")
      return minus(num1, num2)
    elsif(operation == "*")
      return multiple(num1, num2)
    elsif(operation == "/")
      return divide(num1, num2)
    end
  end

  #Basic calculator
  def basic
    #Ask the user to type on 2 numbers and a operation.
    print "Enter first number: "
    #take in user input
    number1 = gets.chomp.to_f
    print "Enter operator number: "
    operator = gets.chomp
    print "Enter second number: "
    number2 = gets.chomp.to_f
    #Find out if the operation is a +, -, * or divide.
    puts operation_selector(operator,number1, number2)
    #rerun main function
    run_calculator
  end

  #Basic long calculator
  def basic_long
    #Ask the user to type on 2 numbers and a operation.
    print "Enter first number: "
    #Take in user input
    number1 = gets.chomp.to_f
    operator = ""
    number2 = 0.0
    pressEquals = false

    while !pressEquals
      print "Enter operator number: "
      operator = gets.chomp
      if(operator == "+") || (operator == "-") || (operator == "/") || (operator == "*")
        print "Enter number: "
        number2 = gets.chomp.to_f
        number1 = operation_selector(operator,number1, number2);
      elsif operator == "="
        puts number1
        pressEquals = true
      end
    end
    #rerun main function
    run_calculator
  end

  def advanced
    print "Which function would you like to us? Square Root(sr) or Power(p): "
    answer = gets.chomp.downcase
    if(answer == "sr" || answer == "square root")
      print "Enter first number: "
      number1 = gets.chomp.to_i
      number1 = Math.sqrt(number1)
      puts number1;

    elsif(answer == "p" || answer == "power")
      print "Enter a number: "
      number1 = gets.chomp.to_i
      print "Enter a power: "
      power = gets.chomp.to_i
      number1 = number1 ** power
      puts number1
    end
    run_calculator
  end

  def metric(weight, height)
    result = (weight / height) / height
    return result
  end

  def imperial(weight, height)
    result = ((weight * 703) / height) / height
    return result
  end

  def bmi
    print "Would you like to use Imperial(i) or Metric measurements(m)?"
    answer = gets.chomp;
    if(answer == "m" || answer == "metric: ")
      print "Type in your weight in kg"
      weight = gets.chomp.to_f
      print "Type in your height in meters: "
      height = gets.chomp.to_f
      puts metric(weight, height)

    elsif(answer == "i" || answer == "imperial")
      print "Type in your weight in pounds: "
      weight = gets.chomp.to_f
      print "Type in your height in inches: "
      height = gets.chomp.to_f
      puts imperial(weight, height)
    end
    run_calculator
  end

  def trip_calculator(distance, fuel_consumption, cost, speed)
    result1 = distance/1000
    result1 = result1 * fuel_consumption;
    result1 = result1 * cost
    result2 = distance/speed
    return "The journey will cost £ #{result1} and will take #{result2}  hr"
  end

end

# calc = CalcEngine.new()
# calc.run_calculator
