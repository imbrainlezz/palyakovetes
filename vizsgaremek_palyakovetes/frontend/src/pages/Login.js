import Avatar from "@mui/material/Avatar";
import Button from "@mui/material/Button";
import CssBaseline from "@mui/material/CssBaseline";
import TextField from "@mui/material/TextField";
import Box from "@mui/material/Box";
import Typography from "@mui/material/Typography";
import Container from "@mui/material/Container";
import Footer from "../components/Footer";
import { useContext, useState } from "react";
import { useNavigate } from "react-router-dom";
import { AuthContext } from "../context/auth/AuthContext";
import fingerprint from "../images/fingerprint.svg";
import { omIdentifierPattern } from "../utils/utils";

export default function SignIn() {
  localStorage.setItem("user", null);
  const [formData, setFormData] = useState({
    om_azon: "",
    jelszo: "",
  });
  const navigate = useNavigate();
  const { login, currentUser } = useContext(AuthContext);
  const [validOM, setValidOM] = useState(false);

  const handleClick = async (event) => {
    if (formData?.om_azon.trim() !== "" || formData?.jelszo.trim() !== "") {
      login(formData)
        .then((e) => {
          if (e.isAdmin === 1) {
            navigate("/admin/users/edit");
          } else if (e.isAdmin === 0) {
            navigate("/classchooser");
          }
        })
        .catch((error) => {
          alert("Nem megfelelő OM azonosító/jelszó páros.");
        });
    }
  };

  return (
    <Container component="main" maxWidth="xs">
      <CssBaseline />
      <Box
        sx={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
        }}
      >
        <Avatar src={fingerprint} sx={{ mt: "40%", bgcolor: "white" }}></Avatar>

        <Typography component="h1" variant="h5">
          Bejelentkezés
        </Typography>
        <Box component="form" onSubmit={handleClick} sx={{ mt: 1 }}>
          <TextField
            error={!validOM}
            helperText={
              formData.om_azon === ""
                ? "Kérjük, írja be az OM azonosítóját!"
                : " " && omIdentifierPattern.test(formData.om_azon) === false
                ? "A megadott OM azonosító nem felel meg a formátumnak. [11 hosszú, csak számok]"
                : " "
            }
            value={formData?.om_azon || ""}
            onChange={({ target: { name, value } }) => {
              setFormData({ ...formData, [name]: value });
              setValidOM(omIdentifierPattern.test(value));
            }}
            margin="normal"
            required
            fullWidth
            label="OM azonosító"
            name="om_azon"
            autoComplete="om_azon"
            autoFocus
            inputProps={{ inputMode: "numeric", pattern: omIdentifierPattern }}
          />
          <TextField
            error={formData.jelszo.trim().length === 0}
            helperText={
              formData.jelszo.length === 0
                ? "Kérjük, írja be a jelszavát!"
                : " "
            }
            value={formData?.jelszo || ""}
            onChange={({ target: { name, value } }) =>
              setFormData({ ...formData, [name]: value })
            }
            margin="normal"
            required
            fullWidth
            name="jelszo"
            label="Jelszó"
            type="password"
          />
          <Button fullWidth onClick={handleClick} variant="contained">
            Bejelentkezés
          </Button>
        </Box>
      </Box>

      <Footer trademark versionNumber />
    </Container>
  );
}
