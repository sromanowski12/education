<?php
        // Name: Seth Romanowski
        // Course: Web Programming
        // Assignment: Lab #18
        //vSemester: Summer, 2019
        class CoursesTaken {
                // Private Data

                private $HostName;
                private $UserID;
                private $Password;
                private $DBName;

                private $Con;

                public function __construct($host = NULL, $uid = NULL, $pw = NULL, $db = NULL)
                {
                    echo("The class constructor is being called... <br />");
                    $this->HostName = $host;
                    $this->UserID = $uid;
                    $this->Password = $pw;
                    $this->DBName = $db;

                    $this->Con = mysqli_connect($host, $uid, $pw, $db);
                    if(mysqli_connect_errno($this->Con))
                    {
                        echo "Failed to connect to MySQL: " . mysqli_connect_error();
                    }
                    else
                        echo "Succesful Connection to MySQL <br />";
                    
                }

                public function __destruct()
                {
                    echo("The class destructor is being called... <br />");
                    mysqli_close($this->Con);
                }

                public function Add_Class($course, $credit, $semester, $year, $grade)
                {
                    $sql = "INSERT INTO classes_taken(Class, Credits, Semester, Year, Grade)
                            VALUES
                                ('$course', $credit, '$semester', '$year', '$grade')";

                    $result = mysqli_query($this->Con, $sql);
                    if($result == true) {
                        echo "Successful Insert <br />";
                    }
                    else {
                        echo "Error Inserting class" . mysqli_error($this->Con) . " <br />";
                    }
                }

                public function Print_Transcript()
                {
                    $sql = "SELECT Class, Credits, Semester, Year, Grade
                            FROM
                                classes_taken";

                    $result = mysqli_query($this->Con, $sql);

                    $arrayResult = array();

                    echo("--------------Start Transcript--------------<br />");
                    while($row = mysqli_fetch_array($result)) {
                        $arrayResult[] = $row;
                        echo($row['Class'] . " " .
                                $row['Credits'] . " " .
                                $row['Semester'] . " " .
                                $row['Year'] . " " .
                                $row['Grade']
                                );
                        echo "<br />";
                    }
                    echo("--------------End Transcript--------------<br />");
                    return($arrayResult);
                }

                public function Total_Credits()
                {
                    $sql = "SELECT sum(Credits) AS Total_Credits
                            FROM
                                classes_taken";
                    $result = mysqli_query($this->Con, $sql);

                    $arrayResult = array();

                    echo("--------------Start Total Credits--------------<br />");
                    while($row = mysqli_fetch_array($result)) {
                        $arrayResult[] = $row;
                        echo("Total credits completed = " . $row['Total_Credits']);
                        echo "<br />";
                    }
                    echo("--------------End Total Credits--------------<br />");
                    return($arrayResult);
                }
        }

?>

<?php
        // Testing the class
        $MyCourses = new CoursesTaken("localhost", "Lab18User", "Pass123Word", "Lab18");
        $MyCourses->Print_Transcript();
        $MyCourses->Total_Credits();

        $MyCourses->Add_Class("CSCI-C490", 3, "Summer", "2019", "A");
        $MyCourses->Print_Transcript();
        $MyCourses->Total_Credits();

?>