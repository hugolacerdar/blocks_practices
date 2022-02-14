class DatabaseDriver
  def initialize(database, user, password)
    @database = database
    @user = user
    @password = password
    @connected = false
  end

  def connect
    # connects to database
    @connected = true
    puts "Connected to #{@database} as #{@user}."
  end

  def disconnect
    # disconnects from database
    puts "Disconnected."
  end

  def execute(sql)
    raise "Not connected!" unless @connected
    puts "Executing #{sql}..."
    # executes SQL
  end

  def begin_transaction
    puts "Beginning transaction..."
  end

  def rollback_transaction
    puts "Rolled back transaction!"
  end

  def commit_transaction
    puts "Committed transaction."
  end

  def transactionally
    begin_transaction
    yield
    commit_transaction
  rescue => _
    rollback_transaction
  end

  def self.open(database, user, password)
    driver = self.new("my_database", "admin", "secret")
    driver.connect
    return driver unless block_given?
    begin
      yield(driver)
    rescue => exception
      puts exception
    ensure
      driver.disconnect
    end
  end
end

DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.transactionally do
    driver.execute("UPDATE ORDERS SET status='completed'")
    raise "Bloooom"
    driver.execute("DELETE * FROM SHIPPING_QUEUE")
  end

  # not run in a transaction
  driver.execute("SELECT * FROM ORDERS")
  driver.execute("SELECT * FROM USERS")
end
