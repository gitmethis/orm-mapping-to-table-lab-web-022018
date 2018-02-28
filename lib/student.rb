require 'sqlite3'
# DB = {:conn => SQLite3::Database.new("db/students.db")}

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  def initialize(name, grade)
      @name = name
      @grade = grade
  end
  
  def name
      @name  
  end
  
  def grade
      @grade  
  end
  
  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql) 
  end
  
  def self.drop_table
    sql =  <<-SQL 
      DROP TABLE students
        SQL
    DB[:conn].execute(sql) 
  end
  
  def save
    puts "**********************#{@name} #{}"
    sql =  <<-SQL 
      INSERT INTO students(name, grade) VALUES (#{@name}, #{@grade})
    SQL
    puts sql
    # sql = "insert into students(name,grade) values ('A','B')"
    DB[:conn].execute(sql) 
  end

  
end
