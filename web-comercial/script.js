// Inicializar ícones Lucide
document.addEventListener('DOMContentLoaded', () => {
    lucide.createIcons();
});

// Scroll suave para seções
function scrollToSection(sectionId) {
    const section = document.getElementById(sectionId);
    if (section) {
        section.scrollIntoView({
            behavior: 'smooth',
            block: 'start'
        });
    }
}

// Video Player
function playVideo() {
    const placeholder = document.getElementById('videoPlaceholder');
    const video = document.getElementById('mainVideo');
    
    if (placeholder && video) {
        placeholder.style.display = 'none';
        video.style.display = 'block';
        video.play();
    }
}

// Sistema de Abas de Pagamento
document.addEventListener('DOMContentLoaded', () => {
    const tabButtons = document.querySelectorAll('.tab-btn');
    const tabPanels = document.querySelectorAll('.tab-panel');
    
    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            const targetTab = button.getAttribute('data-tab');
            
            // Remove active de todos os botões e painéis
            tabButtons.forEach(btn => btn.classList.remove('active'));
            tabPanels.forEach(panel => panel.classList.remove('active'));
            
            // Adiciona active ao botão clicado e painel correspondente
            button.classList.add('active');
            const targetPanel = document.getElementById(targetTab);
            if (targetPanel) {
                targetPanel.classList.add('active');
            }
            
            // Reinicializar ícones Lucide após trocar aba
            lucide.createIcons();
        });
    });
});

// Accordion (FAQ)
function toggleAccordion(button) {
    const item = button.closest('.accordion-item');
    const wasActive = item.classList.contains('active');
    
    // Fechar todos os accordions
    document.querySelectorAll('.accordion-item').forEach(accordionItem => {
        accordionItem.classList.remove('active');
    });
    
    // Se não estava ativo, ativar
    if (!wasActive) {
        item.classList.add('active');
    }
    
    // Reinicializar ícones
    lucide.createIcons();
}

// Handler de Pagamento
function handlePayment(method) {
    const planSelect = document.getElementById('planSelect');
    const selectedPlan = planSelect ? planSelect.value : 'Médio Produtor - R$ 799,00/mês';
    
    alert(`✅ Processando pagamento via ${method}\n\nPlano: ${selectedPlan}\n\nAguarde, você será redirecionado para finalizar o pagamento...`);
}

// Scroll reveal animation (opcional)
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Aplicar animação de entrada em cards
document.addEventListener('DOMContentLoaded', () => {
    const animatedElements = document.querySelectorAll('.card, .pricing-card, .contact-card, .feature-card');
    
    animatedElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
});

// Smooth scroll para toda a página
document.documentElement.style.scrollBehavior = 'smooth';

// Atualizar plano selecionado no texto do botão de pagamento
document.addEventListener('DOMContentLoaded', () => {
    const planSelect = document.getElementById('planSelect');
    
    if (planSelect) {
        planSelect.addEventListener('change', () => {
            console.log('Plano alterado para:', planSelect.value);
        });
    }
});

// Handler de Formulário de Contato
document.addEventListener('DOMContentLoaded', () => {
    const contactForm = document.getElementById('contactForm');
    
    if (contactForm) {
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            // Pegar dados do formulário
            const formData = {
                nome: document.getElementById('nome').value,
                telefone: document.getElementById('telefone').value,
                email: document.getElementById('email').value,
                empresa: document.getElementById('empresa').value,
                rebanho: document.getElementById('rebanho').value,
                estado: document.getElementById('estado').value,
                interesse: document.getElementById('interesse').value,
                mensagem: document.getElementById('mensagem').value
            };
            
            // Simular envio (aqui você conectaria com backend/email)
            alert(`✅ Formulário Enviado com Sucesso!\n\n` +
                  `Olá ${formData.nome}!\n\n` +
                  `Recebemos sua solicitação sobre: ${formData.interesse}\n` +
                  `Tamanho do rebanho: ${formData.rebanho}\n` +
                  `Estado: ${formData.estado}\n\n` +
                  `Nossa equipe comercial entrará em contato através do telefone ${formData.telefone} ` +
                  `ou email ${formData.email} em até 2 horas úteis!\n\n` +
                  `Obrigado pelo interesse no iTrace! 💚🐄`);
            
            // Limpar formulário
            contactForm.reset();
            
            // Scroll suave para o topo da seção de contato
            scrollToSection('contact-section');
        });
    }
});