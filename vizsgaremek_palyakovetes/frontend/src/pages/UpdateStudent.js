import { Button, Checkbox, FormControl, FormControlLabel, InputLabel, MenuItem, Paper, Select, TextField, Typography } from "@mui/material";
import { useNavigate } from "react-router-dom";
import Footer from "../components/Footer";
import Nav from "../components/Nav";

export const UpdateStudent = () => {
  const navigate = useNavigate();

  const handleClick = () => {
    navigate('/home',{replace:true})
  }

    return (
        <>
        <Nav/>
        <Paper style={{padding:"3rem 6rem"}} elevation={2} >
            <Typography variant="h4" color="primary">TANULÓ ADATAINAK MÓDOSÍTÁSA</Typography>
            <h2>iskola neve : osztály</h2>
            <div style={{display:"flex"}}>
            <div className="formstest" style={{width:"35%" ,display: "grid"}}>
                <TextField defaultValue="Jelenlegi érték" id="outlined-basic" label="OM azonosító" variant="outlined" />
                <TextField defaultValue="Jelenlegi érték" id="outlined-basic" label="Név" variant="outlined" />
                
                <FormControl>
                <InputLabel id="demo-simple-select-label">Szakma / Ágazat</InputLabel>
                <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          label="Szakma / ágazat"
          defaultValue="Jelenlegi érték"
        >
          <MenuItem value={"Jelenlegi érték"}>Jelenlegi érték</MenuItem>
          <MenuItem value={"Ágazat 1"}>Ágazat 1</MenuItem>
          <MenuItem value={"Ágazat 2"}>Ágazat 2</MenuItem>
          <MenuItem value={"Ágazat 3"}>Ágazat 3</MenuItem>
        </Select>
        </FormControl>
        <FormControlLabel control={<Checkbox defaultChecked />} label="Nappali munkarend" />
                <Button onClick={handleClick} variant="contained">MÓDOSÍTÁSOK MENTÉSE</Button>
                </div>
                <div className="formstest" style={{marginLeft:"2rem", width:"35%" ,display: "grid"}}>
                <FormControl>
                <InputLabel id="demo-simple-select-label">Pálya kategóriája</InputLabel>
                <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          label="Pálya kategóriája"
          defaultValue="Jelenlegi érték"
        >
          <MenuItem value={"Jelenlegi érték"}>Jelenlegi érték</MenuItem>
          <MenuItem value={"Kategória 1"}>Kategória 1</MenuItem>
          <MenuItem value={"Kategória 2"}>Kategória 2</MenuItem>
          <MenuItem value={"Kategória 3"}>Kategória 3</MenuItem>
        </Select>
        
        <TextField
          id="outlined-multiline-static"
          label="Pálya leírása"
          multiline
          rows={10}
          defaultValue="Jelenlegi érték"
        />
        </FormControl>
                </div>
                </div>
            </Paper>
        <Footer trademark versionNumber />
        </>
    );
  };