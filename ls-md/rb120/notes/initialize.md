This method is [[private]] by default. This is because initialize often contains functionality to set the values of instance variables and it would be too muddy to expose to the public interface. 

```ruby
class DocAppt
  def initialize(name, day_of_week)
    @name = name
    @day_of_week = day_of_week
  end
end

rosa = DocAppt.new('Rosa', 'Tuesday')
rosa.initialize
```

The code above throws the following error: 
```
NoMethodError: private method `initialize' called for #<DocAppt:0x00007ff258299788 @name="Rosa", @day_of_week="Tuesday">
```
