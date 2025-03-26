Gem::Specification.new do |s|
  s.name = "array_utils"
  s.version = "0.0.2"
  s.summary = "Useful array methods and out-of-bounds index handler"
  s.description = <<-DESC
    The default Ruby Array class allows inserting into an array at an that
    doesn't exist. For example, a user may do this `array[2938] = 48` when the
    array contains only about six (6) elements. This causes the the array to now
    contain 2,000 plus of nil elements. The goal is to avoid this by intelligently
    appending to the end of the array when such action is performed.

    Also, invalid negative indexes will throw an `IndexError` exception as usual.

    There are other useful methods added on top of the Array class for common tasks.
  DESC

  s.authors = [ "Maxwell Nana Forson" ]
  s.email = "maxwellnanaforson@gmail.com"

  s.files = Dir["lib/**/*.rb"]

  s.homepage = "https://github.com/nanafox/array_utils"
  s.license = "MIT"

  s.required_ruby_version = ">= 1.9"
end
