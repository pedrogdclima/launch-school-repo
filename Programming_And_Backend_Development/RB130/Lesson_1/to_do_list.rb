
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError unless todo.is_a?(Todo)
    @todos << todo
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def to_a
    @todos.clone
  end

  def done?
    return true if @todos.map{|i|i.done}.all?(true)
    false
  end

  def item_at(index)
    valid_index?(index)
    @todos[index]
  end

  def mark_done_at(index)
    valid_index?(index)
    @todos[index].done!
  end

  def mark_undone_at(index)
    valid_index?(index)
    @todos[index].undone!
  end

  def done!
    @todos.each { |e| e.done! }
  end

  def to_s
    string = "---Today's Todos---\n"
    @todos.each{|e|string << e.to_s << "\n"}
    string
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    valid_index?(index)
    @todos.delete_at(index)
  end

  def each
    index = 0
    while index < size do
      yield(item_at(index))
      index += 1
    end
    self
  end

  def select
    output_list = TodoList.new(title)
    each do |todo|
      output_list.add(todo) if yield(todo)
    end
    output_list
  end

  def find_by_title(title_arg)
    match = nil
    each do |todo|
      if todo.title == title_arg
        return match = todo
      end
    end
    match
  end

  def all_done
    select{|todo|todo.done?}
  end

  def all_not_done
    select{|todo|!todo.done?}
  end

  def mark_done(todo_name)
    find_by_title(todo_name) && find_by_title(todo_name).done!
  end

  def mark_all_done
    each{|todo| todo.done!}
  end

  def mark_all_undone
    each{|todo| todo.undone!}
  end
  
  private

  def valid_index?(index)
    raise IndexError if index > size - 1
    true
  end
end

todo = Todo.new("Testing")
list = TodoList.new("Today")
list.add(todo)
puts list
p list.mark_done_at(0)
puts list

# array = ["Sort costume", "Mail document", "Finish laundry", "Organize date-night", "Answer Slack"]
# todays_todo_list = TodoList.new("Friday")
# array.each{|title| todays_todo_list.add(Todo.new(title))}

# todays_todo_list.mark_done("Organize date-night")
# todays_todo_list.mark_done_at(1)
# puts todays_todo_list


# # given
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")
# todo4 = Todo.new("Finish Todo App")
# # ---- Adding to the list -----

# # add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# #list.add(1)                     # raises TypeError with message "Can only add Todo objects"
# list.add(todo4)

# # <<
# # same behavior as add

# # ---- Interrogating the list -----

# # size
# list.size                       # returns 3

# # first
# list.first                      # returns todo1, which is the first item in the list

# # last
# list.last                       # returns todo3, which is the last item in the list

# #to_a
# list.to_a                      # returns an array of all items in the list

# #done?
# list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----

# # item_at
# # list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# # list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# # list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# # list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# # list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# # list.mark_undone_at(100)        # raises IndexError

# # done!
# #list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # # shift
# # list.shift                      # removes and returns the first item in list

# # # pop
# # list.pop                        # removes and returns the last item in list

# # # remove_at
# # # list.remove_at                  # raises ArgumentError
# # list.remove_at(1)               # removes and returns the 2nd item
# # # list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# list.mark_done_at(1)
# list << Todo.new("Authenticate document")
# puts list                      # returns string representation of the list

# puts list.mark_all_undone

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym
