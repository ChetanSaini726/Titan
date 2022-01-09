newaction {
    trigger = "clean",
    description = "Remove all vs and build files",
    execute = function()
        print("Deleting all vs and build files!")
        os.rmdir("./Build")
        os.remove("**.sln")
        os.remove("**.vcxproj")
        os.remove("**.filters")
        os.remove("**.user")
        print("Finished!")
    end
}
