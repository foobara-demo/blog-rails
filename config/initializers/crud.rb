require "foobara/local_files_crud_driver"

Foobara::Persistence.default_crud_driver = if Rails.env.development?
                                             # :nocov:
                                             Foobara::LocalFilesCrudDriver.new
                                             # :nocov:
                                           elsif Rails.env.test?
                                             Foobara::Persistence::CrudDrivers::InMemory.new
                                           else
                                             # :nocov:
                                             raise "Unknown environment: #{Rails.env}"
                                             # :nocov:
                                           end
