module Aoc
  module Session
    def self.get_session
      return @session if @session

      if persisted?
        @session = load_session
      else
        @session = ask_for_session
        persist_session
      end

      @session
    end

    private

    def self.ask_for_session
      puts "Enter your session key:"
      STDIN.gets.chomp
    end

    def self.load_session
      File.read(session_store)
    end

    def self.persisted?
      File.exist?(session_store)
    end

    def self.persist_session
      File.write(session_store, @session)
    end

    def self.session_store
      File.join(Dir.home, ".aoc.session")
    end
  end
end
