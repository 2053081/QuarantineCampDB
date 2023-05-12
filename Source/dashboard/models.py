from django.db import models

# Create your models here.

class People(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    full_name = models.CharField(db_column='Full name', max_length=25)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    gender = models.CharField(db_column='Gender', max_length=1, blank=True, null=True)  # Field name made lowercase.
    phone = models.CharField(db_column='Phone', max_length=10, blank=True, null=True)  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'People'

class Nurse(models.Model):
    id = models.OneToOneField('People', models.DO_NOTHING, db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Nurse'

class Patient(models.Model):
    identity_number = models.IntegerField(db_column='Identity number', unique=True, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    unique_number = models.AutoField(db_column='Unique number', primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    full_name = models.CharField(db_column='Full name', max_length=25)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    phone = models.CharField(db_column='Phone', max_length=10, blank=True, null=True)  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=50, blank=True, null=True)  # Field name made lowercase.
    discharge_date = models.DateField(db_column='Discharge date', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    nurses_id = models.ForeignKey(Nurse, models.DO_NOTHING, db_column='Nurses id')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    delivered_from = models.CharField(db_column='Delivered from', max_length=50, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    admission_date = models.DateField(db_column='Admission date')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    commorbidities = models.CharField(db_column='Commorbidities', max_length=50, blank=True, null=True)  # Field name made lowercase.
    class Meta:
        managed = False
        db_table = 'Patient'
    def __str__(self):
        return self.full_name

class Tests(models.Model):
    date = models.DateField(db_column='Date', blank=True, null=True)  # Field name made lowercase.
    pcr_test = models.CharField(db_column='PCR test', max_length=10, blank=True, primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    quick_test = models.CharField(db_column='Quick test', max_length=10, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    spo2 = models.IntegerField(db_column='SPO2', blank=True, null=True)  # Field name made lowercase.
    respiratory = models.CharField(db_column='Respiratory', max_length=50, blank=True, null=True)  # Field name made lowercase.
    warning = models.CharField(db_column='Warning', max_length=10, blank=True, null=True)  # Field name made lowercase.
    ct_value = models.IntegerField(db_column='CT value', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    number = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Patient number', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'Tests'

class Track(models.Model):
    symptom = models.CharField(db_column='Symptom', max_length=50, blank=True, null=True)  # Field name made lowercase.
    date = models.DateField(db_column='Date', blank=True, null=True)  # Field name made lowercase.
    patient_number = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Patient number', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'Track'


class Treat(models.Model):
    #doctor_id = models.OneToOneField(Doctor, models.DO_NOTHING, db_column='Doctor id', primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    patient_number = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Patient number')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    start_date = models.DateField(db_column='Start date')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    end_date = models.DateField(db_column='End date', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    result = models.CharField(db_column='Result', max_length=50, blank=True, null=True)  # Field name made lowercase.
