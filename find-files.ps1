# Specify the path to the directory
$directoryPath = "C:\path\to\directory"


# Specify the path to the CSV file containing file names
$csvFilePath = "C:\path\to\file.csv"


# Read the CSV file
$fileNames = Import-Csv -Path $csvFilePath | Select-Object -ExpandProperty Name


# Initialize a counter for the number of files not found
$notFoundCount = 0


# Loop through each file name
foreach ($fileName in $fileNames) {
    $filePath = Join-Path -Path $directoryPath -ChildPath $fileName


    # Check if the file exists
    if (-not (Test-Path -Path $filePath)) {
        Write-Host "File not found: $fileName"
        $notFoundCount++
    }
}


# Log the number of files not found
Write-Host "Number of files not found: $notFoundCount"
