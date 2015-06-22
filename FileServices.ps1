configuration FileServer
{
   WindowsFeature fileservices
        {
            Ensure = "Present"
            Name = "File-Services"
        }
}