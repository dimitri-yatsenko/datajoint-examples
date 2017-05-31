import datajoint as dj
import numpy as np
schema = dj.schema('dj_patient_tests', locals())

@schema
class Person(dj.Manual):
    definition = """ # A person identity.
    person_id : int  # uniquely identifies a person
    ----
    first : varchar(32)
    last : varchar(32)
    """

@schema
class Lab(dj.Manual):
    definition = """ # An course definition.
    lab_id : int #  Unique lab number.
    ----
    contact_id -> Person  #
    """

@schema
class EquipmentType(dj.Manual):
    definition = """ #
    equipmenttype_id : int  # Unique equipmenttype number.
    ----
    equipmenttype_desc : varchar(32)  # describes the equipment type.
    """

@schema
class Equipment(dj.Manual):
    definition = """ #
    ->Lab
    equipment_id : int  # Unique equipment number.
    ----
    -> EquipmentType
    """

@schema
class Test(dj.Manual):
    definition = """ # Generic test details
    test_id : int  # We use int instead of date to ensure uniqueness.
    ----
    -> Equipment
    patient_id -> Person
    doctor_id -> Person
    mass : float  # in Kilograms
    measurement_date : date
    """

@schema
class WeightTest(dj.Manual):
    definition = """ # Measures a person's weight.
    -> Test
    ----
    mass : float  # in Kilograms
    measurement_date : date
    """

@schema
class XrayTest(dj.Imported):
    definition = """ # Xray of a person.
    -> Test
    ----
    xray_image : blob  # binary stored xray imae
    measurement_date : date
    """

@schema
class XrayEnhancement(dj.Computed):
    definition = """ # Post processing of data
    -> XrayTest
    ----
    enhanced_image : blob  # binary enhanced image
    """



schema.spawn_missing_classes()

def create_fake_data():
    pass
