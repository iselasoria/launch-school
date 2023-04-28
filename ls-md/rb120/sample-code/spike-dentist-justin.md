# There's a dental office called Dental People Inc. Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist. Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth. Orthodontists straighten teeth. All of these aforementioned specialties are dentists. All dentists graduated from dental school. Oral surgeons place implants. General dentists fill teeth

=begin
NOUNS:
  - proper nouns:
    - dental office--> name
    - oral surgeons
    - orthodontists
    - general dentist
    - dentists

  - common nouns:
    - teeth
    - implants
    - dental school



VERBS:
    - pull teeth
    - starighten teeth
    - place implants
    - fill teeth
    - graduate

module Pullable
  - pull teeth

class DentalOffice
  - Dental People Inc
  - 2 oral surgeons
  - 2 orthodontists
  - 1 general dentist

class Dentist
  - graduated from dental school
  - work as dentist

class OralSurgeon < Dentist
  - pull teeth
  - place implants

class Orthodontists < Dentist
  - straighten teeth

class GeneralDentist < Dentist
  - pull teeth
  - fill teeth
=end

module Pullable
  def pull_teeth
    "pulling teeth"
  end
end


class DentalOffice
  attr_reader :staff

  def initialize(name)
    @name = name
    @staff = []
  end

  def add_staff(staff)
    self.staff << staff
  end

  private

  attr_writer :staff
end


class Dentist
  attr_reader :name, :graduated

  def initialize(name)
    @name = name
    @gradauted = true
  end

  def work
    "#{name} is "
  end
end

class OralSurgeon < Dentist
  include Pullable

  def place_implant
    "implanting a tooth"
  end

  def work
    super + "#{pull_teeth}" + " and " + "#{place_implant}."
  end
end

class GeneralDentist < Dentist
  include Pullable

  def fill_teeth
    "filling teeth"
  end

  def work
    super + "#{pull_teeth}" + " and " + "#{fill_teeth}."
  end
end

class Orthodontist < Dentist
  def straighten_teeth
    "straightening teeth"
  end

  def work
    super + "#{straighten_teeth}."
  end
end

dental_people_inc = DentalOffice.new("Dental People Inc.")

dental_people_inc.add_staff(OralSurgeon.new("Dr. Gray"))
dental_people_inc.add_staff(OralSurgeon.new("Dr. Blue"))
dental_people_inc.add_staff(Orthodontist.new("Dr. Red"))
dental_people_inc.add_staff(Orthodontist.new("Dr. Green"))
dental_people_inc.add_staff(GeneralDentist.new("Dr. Purple"))

dental_people_inc.staff.each { |dentist| p dentist.work }