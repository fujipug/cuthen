Date object:
    
    Return today's date and time
    var currentTime = new Date()

    Returns the month (from 0 to 11)
    var month = currentTime.getMonth() + 1

    Returns the day of the month (from 1 to 31)
    var day = currentTime.getDate()

    Returns the year (four digits)
    var year = currentTime.getFullYear()

    Write output MM/dd/yyyy
    document.write(month + "/" + day + "/" + year)