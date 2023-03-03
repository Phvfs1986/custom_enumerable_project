module Enumerable
  # Your code goes here
  def my_all?
    if block_given?
      result = true
      my_each { |i| result = false if yield(i) == false }
      result
    else
      self
    end
  end

  def my_any?
    if block_given?
      result = false
      my_each { |i| result = true if yield(i) == true }
      result
    else
      self
    end
  end

  def my_count
    if block_given?
      result = 0
      my_each { |i| result += 1 if yield(i) == true }
      result
    else
      length
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      while i < length
        result = yield(self[i], i)
        i += 1
      end
      result
    end
    self
  end

  def my_inject(initial_value = 0)
    if block_given?
      result = initial_value
      my_each { |i| result = yield(result, i) }
      result
    else
      self
    end
  end

  def my_map
    if block_given?
      result = []
      my_each { |i| result << yield(i) }
      result
    else
      self
    end
  end

  def my_none?
    if block_given?
      result = true
      my_each { |i| result = false if yield(i) == true }
      result
    else
      self
    end
  end

  def my_select
    if block_given?
      result = []
      my_each { |i| result << i if yield(i) == true }
      result
    else
      self
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      i = 0
      while i < length
        yield(self[i])
        i += 1
      end
    end
    self
  end
end
