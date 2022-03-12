# Get user input
$inputFolderPath = Read-Host -Prompt "Input full path directory containing all downloaded csv files"
$folderPath = $inputFolderPath + "\"

# Creates output folder in the input folder
$folderPathDest = $folderPath + "output\"
New-Item -ItemType Directory -Path $folderPath -Name ("output")

# Create 1st file named by date and path
$fileName = "compiled_" + (Get-Date).ToString("yyyyMMdd") + ".csv"
New-Item -ItemType File -Path $folderPathDest -Name ($fileName)
$filePathDest = $folderPathDest + $fileName

# EDIT THE DESIRED COLUMNS ACCORDINGLY, replace test1 and test2
# Get the desired columns from the all the csv files. Fill in yourself.
$desiredColumns = "test1", "test2"
Get-ChildItem $folderPath -Name |
ForEach-Object {
    $filePath = $folderPath + $_
    Import-Csv $filePath | Select $desiredColumns
} | Export-Csv -Path $filePathDest -NoTypeInformation

