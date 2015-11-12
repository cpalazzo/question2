module IntSearcher

  def find_int(list, int)
    if list.nil? then raise "List is nil" end
    raise "List argument is not a list" unless list.respond_to?(:each)
    raise "Int argument is not an int"  unless int.is_a? Integer

    result_arr = nil

    list.each do |arr|
      raise "List contains element that is not an array" unless arr.respond_to?(:each)
      raise "List contains incorrectly sized array" unless arr.size == 4

      unless result_arr then
        if arr.include? int then
          result_arr = arr
        end
      end
    end

    print result_arr.to_s
    result_arr
  end
end
