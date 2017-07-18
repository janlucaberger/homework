require 'sqlite3'
require 'singleton'
require_relative 'plays'


class PlaywrightDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end


class Playwright

  attr_accessor :name, :birth_year

  def self.all
    playwrights = PlaywrightDBConnection.instance.execute(<<-SQL
      SELECT
        *
      FROM
        playwrights
    SQL
    )

    playwrights.map { |pwright| Playwright.new(pwright)}
  end

  def self.find_by_name(name)
    playwright = PlaywrightDBConnection.instance.execute(<<-SQL, name
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
    )
    return nil if playwright.count < 1

    Playwright.new(playwright.last)
  end

  def self.get_id(name)
    data = PlaywrightDBConnection.instance.execute(<<-SQL, name
      SELECT
        id
      FROM
        playwrights
      WHERE
        name = ?
      LIMIT
        1
    SQL
    )

    data.last["id"]
  end

  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @birth_year = options["birth_year"]
  end

  def create
    PlaywrightDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlaywrightDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlaywrightDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end


  def get_plays
    plays = PlayDBConnection.instance.execute(<<-SQL, @id
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    )

    plays.map { |play| Play.new(play) }
  end


end
