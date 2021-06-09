# ***FC*** In order to clear db before and after testing, if you try to comment it and run 'rspec' the testing db won't be empty
RSpec.configure do |config|

    config.before(:suite) do 
        DatabaseCleaner.clean_with :truncation
    end 

    config.after(:suite) do
        DatabaseCleaner.clean_with :truncation
    end
end