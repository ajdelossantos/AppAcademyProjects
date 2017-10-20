require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...

    @columns ||= DBConnection.execute2(<<-SQL)
    SELECT
      *
    FROM
      "#{self.table_name}"
    SQL

    @columns.first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col|

    define_method(col) do
      self.attributes[col]
    end

    define_method("#{col}=") do |value|
      self.attributes[col] = value
    end

    end
  end

  def self.table_name=(table_name)
    "#{table_name}".tableize
  end

  def self.table_name
    "#{self}s".tableize
  end

  def self.all
    # p table_name => 'cats'
    # p self.table_name => 'cats'
    # p self.class.table_name => err

    results = DBConnection.execute(<<-SQL)
    SELECT
      *
    FROM
      "#{self.table_name}"
    SQL

    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map { |hash| self.new(hash) }
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL)
    SELECT
      *
    FROM
      "#{self.table_name}"
    WHERE
      id = "#{id}";
    SQL

    return nil if result.empty?
    self.new(result.first)
  end

  def initialize(params = {})
    # ...
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym

      #TODO hint--use self.class to call class methods
      #IDEA  Object#class-- watch out for scoping concerns
      if !self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      else
      #TODO tells self to receive the setter method
        self.send("#{attr_name}=", value)
      end
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
    col_names

    question_marks = (["?"] * (columns.length)).join(",")


  end

  def update
    # ...
  end

  def save
    # ...
  end
end
