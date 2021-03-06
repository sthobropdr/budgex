require("csv")
require("json")
require("rainbow/refinement")
using Rainbow

class User
    attr_reader :username
    attr_accessor :password

    def initialize(username, password)
        @username = username
        @password = password
    end

    def add
        new_user = {"username" => @username, "password" => @password}

        user_list = JSON.parse(File.read("user_files/users.json"))

        user_list["users"] << new_user

        File.write("user_files/users.json", JSON.generate(user_list))
    end

    def create_transactions_csv
        CSV.open("user_files/#{@username}_transactions.csv", "w") { |row|
            row << ["id", "date", "amount", "description", "category", "recur"]
        }
    end

    def create_balance_csv(balance)
        CSV.open("user_files/#{@username}_balance.csv", "w") { |row|
            row << ["date", "balance"]
            row << [Date.today.to_s, balance]
        }
    end

    def confirm_login_details
        result = nil

        user_list = JSON.parse(File.read("user_files/users.json"))

        user_list["users"].each { |user|
            if user["username"] == @username && user["password"] == @password
                result = 1
                puts "Welcome back, #{@username.upcase}!"
            elsif user["username"] == username && user["password"] != password
                result = 0
            end
        }

        if result.nil?
            puts "\nThose login details couldn't be found".color(:orange).bright
            sleep(1.5)
        elsif result == 0
            puts "\nThe username and password you provided don't match".color(:orange).bright
            sleep(1.5)
        end

        return result
    end

    def confirm_password(password)
        result = nil

        if password == @password
            result = 1
        else
            puts "\nThe password you provided is incorrect".color(:orange).bright
            sleep(1.5)
        end

        return result
    end

    def update_password(new_password)
        user_list = JSON.parse(File.read("user_files/users.json"))

        user_list["users"].each { |user|
            if user["username"] == @username
                user["password"] = new_password
                @password = new_password
            end
        }

        File.write("user_files/users.json", JSON.generate(user_list))
    end

    def sort_transactions
        transactions = CSV.read("user_files/#{@username}_transactions.csv", headers: true)

        transactions = transactions.sort { |a, b| a[1] <=> b[1] }

        CSV.open("user_files/#{@username}_transactions.csv", "w") { |row|
            row << ["id", "date", "amount", "description", "category", "recur"]
            transactions.each { |transaction| row << transaction }
        }
    end

    def generate_new_transaction_id
        id = []

        CSV.foreach("user_files/#{@username}_transactions.csv", headers: true) { |row| id << row["id"].to_i }

        if id.size == 0
            id << 0
        end

        return id.max + 1
    end

    def delete_user_files
        File.delete("user_files/#{@username}_transactions.csv")

        File.delete("user_files/#{@username}_balance.csv")
    end
    
    def delete_user_login
        user_list = JSON.parse(File.read("user_files/users.json"))

        user_list["users"].delete_if { |user| user["username"] == @username }

        File.write("user_files/users.json", JSON.generate(user_list))
    end
end