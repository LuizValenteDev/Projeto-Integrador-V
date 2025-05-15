// Lógica de login
document.getElementById('login-form')?.addEventListener('submit', function(event) {
    event.preventDefault();
    // Adicione a lógica de autenticação aqui
    window.location.href = 'index.html';
});

// Lógica para especialidades
document.getElementById('specialty-form')?.addEventListener('submit', function(event) {
    event.preventDefault();
    const specialty = document.getElementById('specialty').value;
    alert(`Especialidade selecionada: ${specialty}`);
});

// Lógica para agendamentos
document.getElementById('health-form')?.addEventListener('submit', function(event) {
    event.preventDefault();
    
    const date = document.getElementById('date').value;
    const time = document.getElementById('time').value;
    const description = document.getElementById('description').value;
    
    const appointment = document.createElement('li');
    appointment.setAttribute('data-id', Date.now()); // Adiciona um ID único
    appointment.innerHTML = `
        ${date} ${time} - ${description}
        <button onclick="editarAgendamento(this)">Editar</button>
        <button onclick="excluirAgendamento(this)">Excluir</button>
    `;
    
    document.getElementById('appointments-list').appendChild(appointment);
    document.getElementById('health-form').reset();
});

function editarAgendamento(button) {
    const appointmentItem = button.parentElement;
    const [dateTime, description] = appointmentItem.textContent.split(' - ');

    const [date, time] = dateTime.split(' ');

    document.getElementById('date').value = date;
    document.getElementById('time').value = time;
    document.getElementById('description').value = description.trim();

    // Remove o agendamento atual
    appointmentItem.remove();
}

function excluirAgendamento(button) {
    const appointmentItem = button.parentElement;
    appointmentItem.remove();
}
