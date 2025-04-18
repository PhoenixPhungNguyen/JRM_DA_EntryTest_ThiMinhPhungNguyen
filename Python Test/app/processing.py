from openpyxl import load_workbook
import math

class ProcessPartA:
    def __init__(self):
        self.data = {
            "drillholes": [],
            "samples": [],
            "extra": [],
        }
        
    def retrieve_data(self, file_name):
        workbook = load_workbook(filename=file_name)

        # Load DRILLHOLES
        worksheet = workbook["DRILLHOLES"]
        headers = [cell.value for cell in worksheet[1]]
        for row in worksheet.iter_rows(min_row=2, values_only=True):
            self.data["drillholes"].append(dict(zip(headers, row)))

        # Load SAMPLES
        worksheet = workbook["SAMPLES"]
        headers = [cell.value for cell in worksheet[1]]
        for row in worksheet.iter_rows(min_row=2, values_only=True):
            self.data["samples"].append(dict(zip(headers, row)))

        # Load EXTRA_DH_DATA
        worksheet = workbook["EXTRA_DH_DATA"]
        headers = [cell.value for cell in worksheet[1]]
        for row in worksheet.iter_rows(min_row=2, values_only=True):
            self.data["extra"].append(dict(zip(headers, row)))

        # Analyze everything
        print("Analyzing data...")
        self.total_drill_length()
        self.avg_aud_grade()
        self.total_drill_meter_by_com()
        self.sum_drill_meter_by_com()
        self.total_drill_meter_by_day()
        print("=== Distances from New Hole (2.5, 32.5) ===")
        self.distance_from_new_hole(2.5, 32.5)
        print("=== Estimate Au Grade for New Hole (2.5, 32.5) ===")
        self.estimate_au_grade_for_new_hole(2.5, 32.5)
        print("=== Estimate Au Grade for New Hole (7.5, 32.5) ===")
        self.estimate_au_grade_for_new_hole(7.5, 32.5)
        print("=== Estimate Au Grade for New Hole (2.5, 37.5) ===")
        self.estimate_au_grade_for_new_hole(2.5, 37.5)
        print("=== Estimate Au Grade for New Hole (7.5, 37.5) ===")
        self.estimate_au_grade_for_new_hole(7.5, 37.5)

    #Total drilled length
    def total_drill_length(self):

        drilled = 0
        for hole in self.data["drillholes"]:
            drilled += hole["Length (m)"]
        print(f"Total drilled length: {drilled} meters")

    #Average AU Grade
    def avg_aud_grade(self):

        total_grade = 0
        count = 0
        for sample in self.data["samples"]:
            if sample["Au"] != 0.0:
                total_grade += sample["Au"]
                count += 1
        average_grade = 0.0
        if count>0:
            average_grade = round((total_grade / count),3)
        print(f"Average Au grade: {average_grade}")

    #Report on the Total Drilled Meters by Company
    def total_drill_meter_by_com(self):

        # Create a mapping of drillhole names to companies
        self.company_map = {}
        for item in self.data["extra"]:
            if item["Item"] == "COMPANY":
                self.company_map[item["Name"]] = item["Value"]   #MRM001= DESRIG,MRM002= DESRIG,MRM003=HOLESRUS..
     
     ##Sum of the drilled meters by company
    def sum_drill_meter_by_com(self):

        company_drill_lengths = {}
        for hole in self.data["drillholes"]:
            name = hole["Name"]         #MRM001
            length = hole["Length (m)"] #20
            company = self.company_map.get(name)       
            #check if the company is not in the mapping
            if company not in company_drill_lengths:
                company_drill_lengths[company] = 0.0
            #add the length to the company drill lengths
            company_drill_lengths[company] += length
        print("=== Report on the Total Drilled Meters by Company  ===")
        for company, total_length in company_drill_lengths.items():
            print(f"- {company}: {total_length} meters")

    # Report on the Total Meters Drilled Per Day (1st, 2nd, 3rd, and 4th October) 
    def total_drill_meter_by_day(self):

        # Create a mapping of drillhole names to dates
        date_map = {}
        for item in self.data["extra"]:
            if item["Item"] == "DATE":
                date_map[item["Name"]] = item["Value"] #MRM001 = 01-10-2016
        # Sum the drilled meters per day
        daily_drill_lengths = {
            "01-10-2016": 0.0,
            "02-10-2016": 0.0,
            "03-10-2016": 0.0,
            "04-10-2016": 0.0,
        }
        for hole in self.data["drillholes"]:
            name = hole["Name"] #MRM001
            length = hole["Length (m)"] #20
            drill_date = date_map.get(name)
            if drill_date in daily_drill_lengths:
                daily_drill_lengths[drill_date] += length
        print("=== Report on the Total Meters Drilled Per Day ===")
        for date in ["01-10-2016", "02-10-2016", "03-10-2016", "04-10-2016"]:
            print(f"- {date}: {daily_drill_lengths[date]} meters")
    
    #Calculate Distances from New Hole
    def distance_from_new_hole(self,new_x, new_y):

        for hole in self.data["drillholes"]:
            name = hole["Name"]
            x = hole["X"]
            y = hole["Y"]
            distance = ((x - new_x) ** 2 + (y - new_y) ** 2) ** 0.5
            print(f"- {name}: {round(distance, 3)} meters")
    # Estimate Au Grade for New Hole)
    def estimate_au_grade_for_new_hole(self, new_x, new_y):

        # Calculate the distances and find nearby drillholes
        nearby_samples = []
        for hole in self.data["drillholes"]:
            x, y = hole["X"], hole["Y"]
            distance = math.sqrt((x - new_x) ** 2 + (y - new_y) ** 2)
            # If the distance is close enough, we add the Au grade of that sample
            if distance <= 10:  # You can change this threshold as needed
                sample = next((s for s in self.data["samples"] if s["Name"] == hole["Name"]), None)
                if sample:
                    nearby_samples.append(sample["Au"])
        # Calculate the average Au grade for the nearby samples
        if nearby_samples:
            average_au_grade = sum(nearby_samples) / len(nearby_samples)
            average_au_grade = round(average_au_grade, 3)
        else:
            average_au_grade = 0.0
        print(f"Estimated Average Au Grade for New Hole ({new_x}, {new_y}): {average_au_grade}")
